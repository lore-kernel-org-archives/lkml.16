Received: from mout.gmx.net (mout.gmx.net [212.227.15.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89BE220D51A;
	Mon,  3 Feb 2025 18:24:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607061; cv=none; b=p+CiKUxrIrdk3sMT0+eNY+ylyJfUQvC2JZXl070KKkxYoochyr/iOR96SblerLmndA+6tMooGvM+W121Vc2EA9ZOZy2MzlcytTSvrL4BdDcGTX9ISnOdbX09rr6PQOVLaQB/sFiXq7lMRZNaj045S5qdFmcU9eRYeKXDXAck6dw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607061; c=relaxed/simple;
	bh=SPtpWGvbqmN+W75ZUkq3vtyTxotZ42aDS0JUkZjDFLY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IzEPY0O6aeFQwHeBU9AAyP5PVIj1n4k4B+MHVz11jBTnJlFjizseK9dDEV3JJXkWjazFDmiHP5PpCt0MLnCFnRXnYFbCzRoSt1BqTsMDBIqfN7x11wKAuTG6O6pylHNZJVZRFMHI7jca+vmjuoRibfv+AQTPzoT/BWyXHoIKSlg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=G/sXPUj7; arc=none smtp.client-ip=212.227.15.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="G/sXPUj7"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738607027; x=1739211827; i=w_armin@gmx.de;
	bh=xmfu2RYVh771MBfDFi7DG8rB5lvrl48XaZxYDIR3ipc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=G/sXPUj7pa21IR7gJjEkWPZhU5KFG9hgI5sTpry6HnPywPwd1Yhj9dTyOA9B301Z
	 EJqYzlqfmdTmRpjkCRbbYsGUYzkL4hAdZ7bRHHUITSYn0y+OoHjJm/PiKe7mpCAhl
	 NvoTBbgK8vpdClVdtmVdj4duTZryoZD88eh4nZSiC2gd++VjHQ/B2XikaH63OCT/h
	 /o9kKcBDZKtQX1zDTF65iLZ5QDZ2Z2OEdFGIwqhzm7zvhg7Jil4FsZ+x59RGfIcvj
	 Ipj4UFwZxxkjhb4nt2NpoJDQiH/VZnBxyjwgTbjFBsf9xK9l/v/fP+P31AkKlFo1H
	 u/KxI0PwEuQ81Yhoiw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([91.14.238.232]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mn2W5-1syZTY08Mp-00f0h8; Mon, 03 Feb 2025 19:23:47 +0100
From: Armin Wolf <W_Armin@gmx.de>
To: james@equiv.tech,
	markpearson@lenovo.com,
	jorge.lopez2@hp.com
Cc: jdelvare@suse.com,
	linux@roeck-us.net,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	platform-driver-x86@vger.kernel.org,
	corbet@lwn.net,
	linux-doc@vger.kernel.org
Subject: [PATCH 2/7] platform/x86: think-lmi: Use ACPI object when extracting strings
Date: Mon,  3 Feb 2025 19:23:17 +0100
Message-Id: <20250203182322.384883-3-W_Armin@gmx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250203182322.384883-1-W_Armin@gmx.de>
References: <20250203182322.384883-1-W_Armin@gmx.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:bb/+wCwOvLQuxz9Lx/I7N+0Jpm90VYiXUPukI7Z18FxQBrYTJBO
 SoR2Y529ZRKUX3KEewJoBCCsYeC06Au0cklv3f658Tx/YgfLtFK+hNIuZeP11RCSeQVIRmZ
 DgDjAv0dBxVujgS1anoZVJZmbFR93J0P4GthaMkemBkco9M98GO4+RIFVV0HxNnQlrZSCVx
 slVXufTXRBUPCVDsjsRXw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:r6DPjFvY66I=;T9YRFWeBYQJhRWeKiK0VBColj3+
 yd63O9swAJEKEF0fjQJ0CIQI+q2O6fAMDeQ0JevUkAdiO///gQwt0IMMdYYD9cfuVm6/FG702
 NaWxxO+vleW5xkpAfIjiGX5ZKP4Wl/aFA+07Z7DZSYOKNafmKZSZMTjMI2zKEILIF1p6ryOYv
 LVjis8WeLXJRjL0dKrV4t0oSvTa72+JEBl3BgkciSPPLCKIao8K2VWFusGQ14w2OJaP95lHyn
 SDofu2439/teGNXE1dJPSgRzg44us86K5Wir5J9GuYt4gL/+zzjatky4X+BVhRCSp5wGJM2s8
 WzONGGUZ0NkIBkUQVli5GOLlsvdIEI1SH/gKKBu4XPpZZAf4bFZMKnoVi2Uzl0rSdq1ZMJt50
 54eYkAqmYdWCM0GVEgJV5RTRDxVncld9UWxr0p5vdc/ksA8e3F/XFhufx6HcdQS48AgAIRyUQ
 IWTx79UpdJJqDQEFvowUWXCkCrSLOANzkNMK/plAT836Zt7K6JN28n9UgbSoJzE8MIpFshfYX
 ykkDIc1TiS/aCdzy7UX+Qg75WpIYLVuzlTbT0T9BvNevsNw1sSL1Wlzv2LRzOdYYJ7/9Tz1JX
 lRE8GXHFYkU5QHjDUP+1CIDmwSBaJ5nIKKmxLxSn1l9i+Yq793VonkftdnCcPmo/MfWYwU4SH
 VMOK6qEvFhIwbGmkeOJAEEkfZdQ+aSGcteuNn3jamcHWJ/x1AFH7vz7C5CAIUjdwo+pKh3rRu
 rwa82KZhbnWq3672BqCjJN6LtRtwe3jcS5VfxuLhU3IFtVVbqGsKXUnndFbTA0GNwEkIzPQHv
 x97DAamrFP2ZVzKmXNtx3/5Omy7SdioOndvKz3LTkA50JDLvzIlHydx9ppZZwKa+k9vg7+jW2
 MaNjiHDnv1+CVbNBHyzm1R9kndopA9Eanjpy62QMUTcSX1vZ6eGklCQeqvcEc3bHFbBQJ3EGS
 xPloo7oKde3nDZLdognMcfQYxv7XbOM9yVuadl8F2rO0t7gEJg+KSXYbtHPQ28OSROqFbHDuu
 I2glwMWwgNxzsBpzs6MLzOM+lCIzWouIgvm/YE9V4XWJEwdsp27AazEilHnS2UkWuKdhE1z2w
 Na3zXGclPi8v06RWmxMYbiya02BFH/FC6fziV3W6NJFQbep7qHvZUt92lM/Voexb8wI4FfULt
 lK7RG/on24JudH6atwtug5HE22mM5j43nGep51BVgV+okTmVaTFk0nFA74ieKmfd6Ivoz2O3U
 1I32++PIaflj5G3sMp+AM4ONKUTd/TvoyP12f9wdB88vxMwxr61XkQd+wojOeeQCsuhzyZVZx
 VSIexdQJ2dTSSBBQ1/b9F9ol3Y6T/49ZPdJTO+Z3k+zSy0=

Move the ACPI buffer handling out of tlmi_extract_output_string()
and instead pass the unpacked ACPI object to prepare for future
changes.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/think-lmi.c | 38 +++++++++++++++++---------------
 1 file changed, 20 insertions(+), 18 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think=
-lmi.c
index 323316ac6783..2c94a4af9a1d 100644
=2D-- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -262,16 +262,11 @@ static int tlmi_simple_call(const char *guid, const =
char *arg)
 	return 0;
 }

-/* Extract output string from WMI return buffer */
-static int tlmi_extract_output_string(const struct acpi_buffer *output,
-				      char **string)
+/* Extract output string from WMI return value */
+static int tlmi_extract_output_string(union acpi_object *obj, char **stri=
ng)
 {
-	const union acpi_object *obj;
 	char *s;

-	obj =3D output->pointer;
-	if (!obj)
-		return -ENOMEM;
 	if (obj->type !=3D ACPI_TYPE_STRING || !obj->string.pointer)
 		return -EIO;

@@ -352,17 +347,21 @@ static int tlmi_opcode_setting(char *setting, const =
char *value)
 static int tlmi_setting(int item, char **value, const char *guid_string)
 {
 	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
 	acpi_status status;
 	int ret;

 	status =3D wmi_query_block(guid_string, item, &output);
-	if (ACPI_FAILURE(status)) {
-		kfree(output.pointer);
+	if (ACPI_FAILURE(status))
 		return -EIO;
-	}

-	ret =3D tlmi_extract_output_string(&output, value);
-	kfree(output.pointer);
+	obj =3D output.pointer;
+	if (!obj)
+		return -ENODATA;
+
+	ret =3D tlmi_extract_output_string(obj, value);
+	kfree(obj);
+
 	return ret;
 }

@@ -370,19 +369,22 @@ static int tlmi_get_bios_selections(const char *item=
, char **value)
 {
 	const struct acpi_buffer input =3D { strlen(item), (char *)item };
 	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
+	union acpi_object *obj;
 	acpi_status status;
 	int ret;

 	status =3D wmi_evaluate_method(LENOVO_GET_BIOS_SELECTIONS_GUID,
 				     0, 0, &input, &output);
-
-	if (ACPI_FAILURE(status)) {
-		kfree(output.pointer);
+	if (ACPI_FAILURE(status))
 		return -EIO;
-	}

-	ret =3D tlmi_extract_output_string(&output, value);
-	kfree(output.pointer);
+	obj =3D output.pointer;
+	if (!obj)
+		return -ENODATA;
+
+	ret =3D tlmi_extract_output_string(obj, value);
+	kfree(obj);
+
 	return ret;
 }

=2D-
2.39.5

