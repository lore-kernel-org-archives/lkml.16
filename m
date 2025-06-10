Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 483C21FF5F9;
	Tue, 10 Jun 2025 09:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749547557; cv=none; b=JmX6C5SGRBB43S6Meq2gk+wQ5+E1R0OyUqbDG8sT0df1+lTFNA9RwceXmmdMq3MZzXWTGYT+eeZ6MQUFbJdhhSvMFZmza/dhVLYuUF6K7VhaWUeBUfn7XaKgo3LQgp63F08pLIqgTFUpD3d75vHjZSoglBtKOqOZcirPPQaegpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749547557; c=relaxed/simple;
	bh=aQjcjTHIzb/vMu+yXJj3T9W0GjNusIm2WO65ALe6tmk=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=leaSg/1QHa/J30eY4TPEeQGn/h9Hdvx5avlwyjdh9mqBkBQsc/b+LrXebBYdDB4APJ3r7Ry5Uw8+lO4+v/3ochdCCl/oBekMLAdb2j7wnARAjy+4UWUse4UU+WD+Pv9Hd+HNM7/LTJYzMH1eDDOuWxPLYB9qGBGZWDR2wGcjMQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hRsdkErb; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hRsdkErb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 687D4C4CEED;
	Tue, 10 Jun 2025 09:25:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749547556;
	bh=aQjcjTHIzb/vMu+yXJj3T9W0GjNusIm2WO65ALe6tmk=;
	h=From:To:Cc:Subject:Date:From;
	b=hRsdkErb/jIkiv6WlB0D4CjuNUvqeRKyLz/+/VV3Bejpm2Y0bQAhi3qBm2FZKxv4M
	 37zLi3lngk1b0Lwn4Z5f/flz0AFpSKYY6iLxklKLL34kMaUb79jnYe8WXwtWSRKGjT
	 Rtv5TjqitQsQI0LZjnG8OpBjQkJeLCJvFSOJfPWOoMHRCIEfsPjk6E1zFcd56LtEl8
	 Gl5RnHKRZSc2M9xfN61ZDaa4i2S+b/fgBYsdMzG7tElMassrtBlVYqghw/zJpIbUQE
	 JporuABNFgTyCh6DEE/A4rOMy02hyDgsnTQ49sOQxNbNkfp7IApHIAponKVMWQK5Rg
	 jQLOeGqNBmP8w==
From: Arnd Bergmann <arnd@kernel.org>
To: Jean Delvare <jdelvare@suse.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Eddie James <eajames@linux.vnet.ibm.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Al Viro <viro@zeniv.linux.org.uk>,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] hwmon: occ: fix unaligned accesses
Date: Tue, 10 Jun 2025 11:25:49 +0200
Message-Id: <20250610092553.2641094-1-arnd@kernel.org>
X-Mailer: git-send-email 2.39.5
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Arnd Bergmann <arnd@arndb.de>

Passing a pointer to an unaligned integer as a function argument is
undefined behavior:

drivers/hwmon/occ/common.c:492:27: warning: taking address of packed member 'accumulator' of class or structure 'power_sensor_2' may result in an unaligned pointer value [-Waddress-of-packed-member]
  492 |   val = occ_get_powr_avg(&power->accumulator,
      |                           ^~~~~~~~~~~~~~~~~~
drivers/hwmon/occ/common.c:493:13: warning: taking address of packed member 'update_tag' of class or structure 'power_sensor_2' may result in an unaligned pointer value [-Waddress-of-packed-member]
  493 |            &power->update_tag);
      |             ^~~~~~~~~~~~~~~~~

Move the get_unaligned() calls out of the function and pass these
through argument registers instead.

Fixes: c10e753d43eb ("hwmon (occ): Add sensor types and versions")
Signed-off-by: Arnd Bergmann <arnd@arndb.de>
---
 drivers/hwmon/occ/common.c | 28 +++++++++++++---------------
 1 file changed, 13 insertions(+), 15 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 9029ad53790b..b3694a4209b9 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -459,12 +459,10 @@ static ssize_t occ_show_power_1(struct device *dev,
 	return sysfs_emit(buf, "%llu\n", val);
 }
 
-static u64 occ_get_powr_avg(u64 *accum, u32 *samples)
+static u64 occ_get_powr_avg(u64 accum, u32 samples)
 {
-	u64 divisor = get_unaligned_be32(samples);
-
-	return (divisor == 0) ? 0 :
-		div64_u64(get_unaligned_be64(accum) * 1000000ULL, divisor);
+	return (samples == 0) ? 0 :
+		mul_u64_u32_div(accum, 1000000UL, samples);
 }
 
 static ssize_t occ_show_power_2(struct device *dev,
@@ -489,8 +487,8 @@ static ssize_t occ_show_power_2(struct device *dev,
 				  get_unaligned_be32(&power->sensor_id),
 				  power->function_id, power->apss_channel);
 	case 1:
-		val = occ_get_powr_avg(&power->accumulator,
-				       &power->update_tag);
+		val = occ_get_powr_avg(get_unaligned_be64(&power->accumulator),
+				       get_unaligned_be32(&power->update_tag));
 		break;
 	case 2:
 		val = (u64)get_unaligned_be32(&power->update_tag) *
@@ -527,8 +525,8 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		return sysfs_emit(buf, "%u_system\n",
 				  get_unaligned_be32(&power->sensor_id));
 	case 1:
-		val = occ_get_powr_avg(&power->system.accumulator,
-				       &power->system.update_tag);
+		val = occ_get_powr_avg(get_unaligned_be64(&power->system.accumulator),
+				       get_unaligned_be32(&power->system.update_tag));
 		break;
 	case 2:
 		val = (u64)get_unaligned_be32(&power->system.update_tag) *
@@ -541,8 +539,8 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		return sysfs_emit(buf, "%u_proc\n",
 				  get_unaligned_be32(&power->sensor_id));
 	case 5:
-		val = occ_get_powr_avg(&power->proc.accumulator,
-				       &power->proc.update_tag);
+		val = occ_get_powr_avg(get_unaligned_be64(&power->proc.accumulator),
+				       get_unaligned_be32(&power->proc.update_tag));
 		break;
 	case 6:
 		val = (u64)get_unaligned_be32(&power->proc.update_tag) *
@@ -555,8 +553,8 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		return sysfs_emit(buf, "%u_vdd\n",
 				  get_unaligned_be32(&power->sensor_id));
 	case 9:
-		val = occ_get_powr_avg(&power->vdd.accumulator,
-				       &power->vdd.update_tag);
+		val = occ_get_powr_avg(get_unaligned_be64(&power->vdd.accumulator),
+				       get_unaligned_be32(&power->vdd.update_tag));
 		break;
 	case 10:
 		val = (u64)get_unaligned_be32(&power->vdd.update_tag) *
@@ -569,8 +567,8 @@ static ssize_t occ_show_power_a0(struct device *dev,
 		return sysfs_emit(buf, "%u_vdn\n",
 				  get_unaligned_be32(&power->sensor_id));
 	case 13:
-		val = occ_get_powr_avg(&power->vdn.accumulator,
-				       &power->vdn.update_tag);
+		val = occ_get_powr_avg(get_unaligned_be64(&power->vdn.accumulator),
+				       get_unaligned_be32(&power->vdn.update_tag));
 		break;
 	case 14:
 		val = (u64)get_unaligned_be32(&power->vdn.update_tag) *
-- 
2.39.5

