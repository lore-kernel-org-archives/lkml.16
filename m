Received: from out-189.mta1.migadu.com (out-189.mta1.migadu.com [95.215.58.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E3B7224252
	for <linux-kernel@vger.kernel.org>; Mon,  7 Apr 2025 22:37:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744065448; cv=none; b=eJoEt8exLeUlYQqLP5iT22UgGPAFev1bdQz0uwwK+tCq7T28F5ewwMyFsHYJZm0d/p4hWlI530lTlbIwEJNAnxKoQ7XLiRLyX8TPM+3t8yyuQEF+Hpgz+dzF0CgsRjcPjlX5UT4TP+V6ygkpUTWo5ZW87uFWpUr8ntP5ZXI/3dE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744065448; c=relaxed/simple;
	bh=MQM1kmIoyeIPIvXSo+fdLdzfUuOIRsInGoIf6OY/FxA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sl041RmyCXQy9RVcw24CVjZz2kE2lwjl9jOMpYxX+8ye9Fy7OLWF+WpJaAGg2UNCF2AiOuEPPogyX1s/6zbVL3DtZmBGmB0u/ZPdn3DdgE/zIbCSozVKeDNSIlsiBVum/mdbgm7WbpSKAJhpWOpiPdGqA72SY3tXioI6La//i28=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=E/gjyn3e; arc=none smtp.client-ip=95.215.58.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="E/gjyn3e"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744065443;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=0XQwgBGUl+kN6A+/kOzVZipYCaxZjyIp9j83vL3Yths=;
	b=E/gjyn3eXJgs6JaLMvFqLeCUH5QHFYamcevGa6Rr4uF4/gIcHmdh1mHQsIne5nw1xa7BZq
	XkcMcI+hIjtFacsTC3HG80QvRF75Dif0ywvGrW9uzwAgHqWt6IrmZXDZb15KZJnIpo60fM
	GWzH3uDint/eKFdS3qez3rZrj0hW31o=
From: Sean Anderson <sean.anderson@linux.dev>
To: Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@google.com>,
	devicetree@vger.kernel.org
Cc: Sakari Ailus <sakari.ailus@linux.intel.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Len Brown <lenb@kernel.org>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	linux-kernel@vger.kernel.org,
	Danilo Krummrich <dakr@kernel.org>,
	linux-acpi@vger.kernel.org,
	Sean Anderson <sean.anderson@linux.dev>
Subject: [PATCH 1/2] device property: Add optional nargs_prop for get_reference_args
Date: Mon,  7 Apr 2025 18:37:13 -0400
Message-Id: <20250407223714.2287202-2-sean.anderson@linux.dev>
In-Reply-To: <20250407223714.2287202-1-sean.anderson@linux.dev>
References: <20250407223714.2287202-1-sean.anderson@linux.dev>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

get_reference_args does not permit falling back to nargs when nargs_prop
is missing. This makes it difficult to support older devicetrees where
nargs_prop may not be present. Add support for this by converting nargs
to a signed value. Where before nargs was ignored if nargs_prop was
passed, now nargs is only ignored if it is strictly negative. When it is
positive, nargs represents the fallback cells to use if nargs_prop is
absent.

Signed-off-by: Sean Anderson <sean.anderson@linux.dev>
---

 drivers/base/property.c |  4 ++--
 drivers/base/swnode.c   | 13 +++++++++----
 drivers/of/property.c   | 10 +++-------
 include/linux/fwnode.h  |  2 +-
 4 files changed, 15 insertions(+), 14 deletions(-)

diff --git a/drivers/base/property.c b/drivers/base/property.c
index c1392743df9c..049f8a6088a1 100644
--- a/drivers/base/property.c
+++ b/drivers/base/property.c
@@ -606,7 +606,7 @@ int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
 		return -ENOENT;
 
 	ret = fwnode_call_int_op(fwnode, get_reference_args, prop, nargs_prop,
-				 nargs, index, args);
+				 nargs_prop ? -1 : nargs, index, args);
 	if (ret == 0)
 		return ret;
 
@@ -614,7 +614,7 @@ int fwnode_property_get_reference_args(const struct fwnode_handle *fwnode,
 		return ret;
 
 	return fwnode_call_int_op(fwnode->secondary, get_reference_args, prop, nargs_prop,
-				  nargs, index, args);
+				  nargs_prop ? -1 : nargs, index, args);
 }
 EXPORT_SYMBOL_GPL(fwnode_property_get_reference_args);
 
diff --git a/drivers/base/swnode.c b/drivers/base/swnode.c
index b1726a3515f6..11af2001478f 100644
--- a/drivers/base/swnode.c
+++ b/drivers/base/swnode.c
@@ -503,7 +503,7 @@ software_node_get_named_child_node(const struct fwnode_handle *fwnode,
 static int
 software_node_get_reference_args(const struct fwnode_handle *fwnode,
 				 const char *propname, const char *nargs_prop,
-				 unsigned int nargs, unsigned int index,
+				 int nargs, unsigned int index,
 				 struct fwnode_reference_args *args)
 {
 	struct swnode *swnode = to_swnode(fwnode);
@@ -543,10 +543,15 @@ software_node_get_reference_args(const struct fwnode_handle *fwnode,
 		error = property_entry_read_int_array(ref->node->properties,
 						      nargs_prop, sizeof(u32),
 						      &nargs_prop_val, 1);
-		if (error)
+
+		if (error == -EINVAL) {
+			if (nargs < 0)
+				return error;
+		} else if (error) {
 			return error;
-
-		nargs = nargs_prop_val;
+		} else {
+			nargs = nargs_prop_val;
+		}
 	}
 
 	if (nargs > NR_FWNODE_REFERENCE_ARGS)
diff --git a/drivers/of/property.c b/drivers/of/property.c
index c1feb631e383..c41190e47111 100644
--- a/drivers/of/property.c
+++ b/drivers/of/property.c
@@ -1116,19 +1116,15 @@ of_fwnode_get_named_child_node(const struct fwnode_handle *fwnode,
 static int
 of_fwnode_get_reference_args(const struct fwnode_handle *fwnode,
 			     const char *prop, const char *nargs_prop,
-			     unsigned int nargs, unsigned int index,
+			     int nargs, unsigned int index,
 			     struct fwnode_reference_args *args)
 {
 	struct of_phandle_args of_args;
 	unsigned int i;
 	int ret;
 
-	if (nargs_prop)
-		ret = of_parse_phandle_with_args(to_of_node(fwnode), prop,
-						 nargs_prop, index, &of_args);
-	else
-		ret = of_parse_phandle_with_fixed_args(to_of_node(fwnode), prop,
-						       nargs, index, &of_args);
+	ret = __of_parse_phandle_with_args(to_of_node(fwnode), prop, nargs_prop,
+					   nargs, index, &of_args);
 	if (ret < 0)
 		return ret;
 	if (!args) {
diff --git a/include/linux/fwnode.h b/include/linux/fwnode.h
index 6fa0a268d538..69fe44c68f8c 100644
--- a/include/linux/fwnode.h
+++ b/include/linux/fwnode.h
@@ -163,7 +163,7 @@ struct fwnode_operations {
 				const char *name);
 	int (*get_reference_args)(const struct fwnode_handle *fwnode,
 				  const char *prop, const char *nargs_prop,
-				  unsigned int nargs, unsigned int index,
+				  int nargs, unsigned int index,
 				  struct fwnode_reference_args *args);
 	struct fwnode_handle *
 	(*graph_get_next_endpoint)(const struct fwnode_handle *fwnode,
-- 
2.35.1.1320.gc452695387.dirty

