Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A2128AAEA;
	Tue, 10 Jun 2025 09:23:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547401; cv=none; b=tFmmMoXZMYSKMiaDzaD5Kva8G4PmVLL9YAAMsLtg3oAYjx+t8+juEDUgs/a7pfJe90f+7fZfB0wwntgO8PGQP6qOjKyS1CQjtN1EY4kJfaMtGII/9xXUcTSv2nOHVju4B9H3H06Wv+sm5ZWR9sgtoBgAQyX59Ecqs6/rfKbrih8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547401; c=relaxed/simple;
	bh=VGG7WeyDMC90Ngljj+ICrpnjdyYhEttx1JmQl42ojOw=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=BgfmC35eY9TCsA13IQtuL7emWf949KbYKgjr8C288ksTxu97mfIGxFOIVP8jEGBTeal4+1TeUpEqbnl5yRHKYbmFTxbuJ7mHeOXkRYG7j0iz2YVWPmal3pNkzBA5w25uvbe8SZQDtpUjsDY2Bz940EIMeNzVb6PewQ8fRp3IR6Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iMxHkg9+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iMxHkg9+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B71AC4CEED;
	Tue, 10 Jun 2025 09:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749547401;
	bh=VGG7WeyDMC90Ngljj+ICrpnjdyYhEttx1JmQl42ojOw=;
	h=From:To:Cc:Subject:Date:From;
	b=iMxHkg9+73UkrFG8P2JYE1iB4yxAPmkrTfbyzqZDiNu9ZLaYcm+1B7Sf7DZbbSZGF
	 +4nxsvVSBl3Mt3W8Hn/TUlHNjcOvN1jm0bu+4hqAxE2Agwnr71/icO2LjXvMOTmYsb
	 k07YXVkYHL7BICmNcbrK9m+9vWmmcNh6ld0kxKkEtbSBYE8dPI67EWbuSy7Jr9TfMA
	 pc8NtsSvrB6HjhfruEC5m1q8Ve/JDhv0H7B8WRI/gpwMhmjOOHFAFY6SG9uhCB/q9u
	 +yqa9qv4J41M2Rl6Tj2/yq4CsOT1/53KuywQ2zaGqQgiB1blgizdandqMLuWsn9q0o
	 vjeO1NBknqqcw==
From: Arnd Bergmann <arnd@kernel.org>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Nathan Chancellor <nathan@kernel.org>,
	Eddie James <eajames@linux.vnet.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] hwmon: occ: rework attribute registration for stack usage
Date: Tue, 10 Jun 2025 11:23:06 +0200
Message-Id: <20250610092315.2640039-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

clang produces an output with excessive stack usage when building the
occ_setup_sensor_attrs() function, apparently the result of having
a lot of struct literals and building with the -fno-strict-overflow
option that leads clang to skip some optimization in case the 'attr'
pointer overruns:

drivers/hwmon/occ/common.c:775:12: error: stack frame size (1392) exceeds limit (1280) in 'occ_setup_sensor_attrs' [-Werror,-Wframe-larger-than]

Replace the custom macros for initializing the attributes with a
simpler function call that does not run into this corner case.

Link: https://godbolt.org/z/Wf1Yx76a5
Fixes: 54076cb3b5ff ("hwmon (occ): Add sensor attributes and register hwmon device")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hwmon/occ/common.c | 212 +++++++++++++++----------------------
 1 file changed, 85 insertions(+), 127 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 36b3900218ce..b3694a4209b9 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -745,29 +745,30 @@ static ssize_t occ_show_extended(struct device *dev,
 }
 
 /*
- * Some helper macros to make it easier to define an occ_attribute. Since these
- * are dynamically allocated, we shouldn't use the existing kernel macros which
+ * A helper to make it easier to define an occ_attribute. Since these
+ * are dynamically allocated, we cannot use the existing kernel macros which
  * stringify the name argument.
  */
-#define ATTR_OCC(_name, _mode, _show, _store) {				\
-	.attr	= {							\
-		.name = _name,						\
-		.mode = VERIFY_OCTAL_PERMISSIONS(_mode),		\
-	},								\
-	.show	= _show,						\
-	.store	= _store,						\
-}
-
-#define SENSOR_ATTR_OCC(_name, _mode, _show, _store, _nr, _index) {	\
-	.dev_attr	= ATTR_OCC(_name, _mode, _show, _store),	\
-	.index		= _index,					\
-	.nr		= _nr,						\
+static void occ_init_attribute(struct occ_attribute *attr, int mode,
+	ssize_t (*show)(struct device *dev, struct device_attribute *attr, char *buf),
+	ssize_t (*store)(struct device *dev, struct device_attribute *attr,
+				   const char *buf, size_t count),
+	int nr, int index, const char *fmt, ...)
+{
+	va_list args;
+
+	va_start(args, fmt);
+	vsnprintf(attr->name, sizeof(attr->name), fmt, args);
+	va_end(args);
+
+	attr->sensor.dev_attr.attr.name = attr->name;
+	attr->sensor.dev_attr.attr.mode = mode;
+	attr->sensor.dev_attr.show = show;
+	attr->sensor.dev_attr.store = store;
+	attr->sensor.index = index;
+	attr->sensor.nr = nr;
 }
 
-#define OCC_INIT_ATTR(_name, _mode, _show, _store, _nr, _index)		\
-	((struct sensor_device_attribute_2)				\
-		SENSOR_ATTR_OCC(_name, _mode, _show, _store, _nr, _index))
-
 /*
  * Allocate and instatiate sensor_device_attribute_2s. It's most efficient to
  * use our own instead of the built-in hwmon attribute types.
@@ -853,14 +854,15 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 		sensors->extended.num_sensors = 0;
 	}
 
-	occ->attrs = devm_kzalloc(dev, sizeof(*occ->attrs) * num_attrs,
+	occ->attrs = devm_kcalloc(dev, num_attrs, sizeof(*occ->attrs),
 				  GFP_KERNEL);
 	if (!occ->attrs)
 		return -ENOMEM;
 
 	/* null-terminated list */
-	occ->group.attrs = devm_kzalloc(dev, sizeof(*occ->group.attrs) *
-					num_attrs + 1, GFP_KERNEL);
+	occ->group.attrs = devm_kcalloc(dev, num_attrs + 1,
+					sizeof(*occ->group.attrs),
+					GFP_KERNEL);
 	if (!occ->group.attrs)
 		return -ENOMEM;
 
@@ -870,43 +872,33 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 		s = i + 1;
 		temp = ((struct temp_sensor_2 *)sensors->temp.data) + i;
 
-		snprintf(attr->name, sizeof(attr->name), "temp%d_label", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
-					     0, i);
+		occ_init_attribute(attr, 0444, show_temp, NULL,
+				   0, i, "temp%d_label", s);
 		attr++;
 
 		if (sensors->temp.version == 2 &&
 		    temp->fru_type == OCC_FRU_TYPE_VRM) {
-			snprintf(attr->name, sizeof(attr->name),
-				 "temp%d_alarm", s);
+			occ_init_attribute(attr, 0444, show_temp, NULL,
+					   1, i, "temp%d_alarm", s);
 		} else {
-			snprintf(attr->name, sizeof(attr->name),
-				 "temp%d_input", s);
+			occ_init_attribute(attr, 0444, show_temp, NULL,
+					   1, i, "temp%d_input", s);
 		}
 
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_temp, NULL,
-					     1, i);
 		attr++;
 
 		if (sensors->temp.version > 1) {
-			snprintf(attr->name, sizeof(attr->name),
-				 "temp%d_fru_type", s);
-			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-						     show_temp, NULL, 2, i);
+			occ_init_attribute(attr, 0444, show_temp, NULL,
+					   2, i, "temp%d_fru_type", s);
 			attr++;
 
-			snprintf(attr->name, sizeof(attr->name),
-				 "temp%d_fault", s);
-			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-						     show_temp, NULL, 3, i);
+			occ_init_attribute(attr, 0444, show_temp, NULL,
+					   3, i, "temp%d_fault", s);
 			attr++;
 
 			if (sensors->temp.version == 0x10) {
-				snprintf(attr->name, sizeof(attr->name),
-					 "temp%d_max", s);
-				attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-							     show_temp, NULL,
-							     4, i);
+				occ_init_attribute(attr, 0444, show_temp, NULL,
+						   4, i, "temp%d_max", s);
 				attr++;
 			}
 		}
@@ -915,14 +907,12 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 	for (i = 0; i < sensors->freq.num_sensors; ++i) {
 		s = i + 1;
 
-		snprintf(attr->name, sizeof(attr->name), "freq%d_label", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_freq, NULL,
-					     0, i);
+		occ_init_attribute(attr, 0444, show_freq, NULL,
+				   0, i, "freq%d_label", s);
 		attr++;
 
-		snprintf(attr->name, sizeof(attr->name), "freq%d_input", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_freq, NULL,
-					     1, i);
+		occ_init_attribute(attr, 0444, show_freq, NULL,
+				   1, i, "freq%d_input", s);
 		attr++;
 	}
 
@@ -938,32 +928,24 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 			s = (i * 4) + 1;
 
 			for (j = 0; j < 4; ++j) {
-				snprintf(attr->name, sizeof(attr->name),
-					 "power%d_label", s);
-				attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-							     show_power, NULL,
-							     nr++, i);
+				occ_init_attribute(attr, 0444, show_power,
+						   NULL, nr++, i,
+						   "power%d_label", s);
 				attr++;
 
-				snprintf(attr->name, sizeof(attr->name),
-					 "power%d_average", s);
-				attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-							     show_power, NULL,
-							     nr++, i);
+				occ_init_attribute(attr, 0444, show_power,
+						   NULL, nr++, i,
+						   "power%d_average", s);
 				attr++;
 
-				snprintf(attr->name, sizeof(attr->name),
-					 "power%d_average_interval", s);
-				attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-							     show_power, NULL,
-							     nr++, i);
+				occ_init_attribute(attr, 0444, show_power,
+						   NULL, nr++, i,
+						   "power%d_average_interval", s);
 				attr++;
 
-				snprintf(attr->name, sizeof(attr->name),
-					 "power%d_input", s);
-				attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-							     show_power, NULL,
-							     nr++, i);
+				occ_init_attribute(attr, 0444, show_power,
+						   NULL, nr++, i,
+						   "power%d_input", s);
 				attr++;
 
 				s++;
@@ -975,28 +957,20 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 		for (i = 0; i < sensors->power.num_sensors; ++i) {
 			s = i + 1;
 
-			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_label", s);
-			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-						     show_power, NULL, 0, i);
+			occ_init_attribute(attr, 0444, show_power, NULL,
+					   0, i, "power%d_label", s);
 			attr++;
 
-			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_average", s);
-			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-						     show_power, NULL, 1, i);
+			occ_init_attribute(attr, 0444, show_power, NULL,
+					   1, i, "power%d_average", s);
 			attr++;
 
-			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_average_interval", s);
-			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-						     show_power, NULL, 2, i);
+			occ_init_attribute(attr, 0444, show_power, NULL,
+					   2, i, "power%d_average_interval", s);
 			attr++;
 
-			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_input", s);
-			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-						     show_power, NULL, 3, i);
+			occ_init_attribute(attr, 0444, show_power, NULL,
+					   3, i, "power%d_input", s);
 			attr++;
 		}
 
@@ -1004,56 +978,43 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 	}
 
 	if (sensors->caps.num_sensors >= 1) {
-		snprintf(attr->name, sizeof(attr->name), "power%d_label", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
-					     0, 0);
+		occ_init_attribute(attr, 0444, show_caps, NULL,
+				   0, 0, "power%d_label", s);
 		attr++;
 
-		snprintf(attr->name, sizeof(attr->name), "power%d_cap", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
-					     1, 0);
+		occ_init_attribute(attr, 0444, show_caps, NULL,
+				   1, 0, "power%d_cap", s);
 		attr++;
 
-		snprintf(attr->name, sizeof(attr->name), "power%d_input", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
-					     2, 0);
+		occ_init_attribute(attr, 0444, show_caps, NULL,
+				   2, 0, "power%d_input", s);
 		attr++;
 
-		snprintf(attr->name, sizeof(attr->name),
-			 "power%d_cap_not_redundant", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
-					     3, 0);
+		occ_init_attribute(attr, 0444, show_caps, NULL,
+				   3, 0, "power%d_cap_not_redundant", s);
 		attr++;
 
-		snprintf(attr->name, sizeof(attr->name), "power%d_cap_max", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
-					     4, 0);
+		occ_init_attribute(attr, 0444, show_caps, NULL,
+				   4, 0, "power%d_cap_max", s);
 		attr++;
 
-		snprintf(attr->name, sizeof(attr->name), "power%d_cap_min", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444, show_caps, NULL,
-					     5, 0);
+		occ_init_attribute(attr, 0444, show_caps, NULL,
+				   5, 0, "power%d_cap_min", s);
 		attr++;
 
-		snprintf(attr->name, sizeof(attr->name), "power%d_cap_user",
-			 s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0644, show_caps,
-					     occ_store_caps_user, 6, 0);
+		occ_init_attribute(attr, 0644, show_caps, occ_store_caps_user,
+				   6, 0, "power%d_cap_user", s);
 		attr++;
 
 		if (sensors->caps.version > 1) {
-			snprintf(attr->name, sizeof(attr->name),
-				 "power%d_cap_user_source", s);
-			attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-						     show_caps, NULL, 7, 0);
+			occ_init_attribute(attr, 0444, show_caps, NULL,
+					   7, 0, "power%d_cap_user_source", s);
 			attr++;
 
 			if (sensors->caps.version > 2) {
-				snprintf(attr->name, sizeof(attr->name),
-					 "power%d_cap_min_soft", s);
-				attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-							     show_caps, NULL,
-							     8, 0);
+				occ_init_attribute(attr, 0444, show_caps, NULL,
+						   8, 0,
+						   "power%d_cap_min_soft", s);
 				attr++;
 			}
 		}
@@ -1062,19 +1023,16 @@ static int occ_setup_sensor_attrs(struct occ *occ)
 	for (i = 0; i < sensors->extended.num_sensors; ++i) {
 		s = i + 1;
 
-		snprintf(attr->name, sizeof(attr->name), "extn%d_label", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     occ_show_extended, NULL, 0, i);
+		occ_init_attribute(attr, 0444, occ_show_extended, NULL,
+				   0, i, "extn%d_label", s);
 		attr++;
 
-		snprintf(attr->name, sizeof(attr->name), "extn%d_flags", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     occ_show_extended, NULL, 1, i);
+		occ_init_attribute(attr, 0444, occ_show_extended, NULL,
+				   1, i, "extn%d_flags", s);
 		attr++;
 
-		snprintf(attr->name, sizeof(attr->name), "extn%d_input", s);
-		attr->sensor = OCC_INIT_ATTR(attr->name, 0444,
-					     occ_show_extended, NULL, 2, i);
+		occ_init_attribute(attr, 0444, occ_show_extended, NULL,
+				   2, i, "extn%d_input", s);
 		attr++;
 	}
 
-- 
2.39.5

