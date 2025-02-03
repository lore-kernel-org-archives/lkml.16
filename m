Received: from mout.gmx.net (mout.gmx.net [212.227.15.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E80B20E022;
	Mon,  3 Feb 2025 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607062; cv=none; b=gfwGWKqt+uuRVrZRPi8I/IhJJOnKr/coUSGRNTLLYuITFBu0u47OcL+6x4GsXVMjGsZLN0Vyk9QrntfPhpWv31CXLnGozwQx9CmkpEeiDs18kv9pSzMYoYO4W8cjWCaPnpKqexcFV2KK5QPsTskhqMslKn2eEghiNt04Haz+lDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607062; c=relaxed/simple;
	bh=Pd2pijAnpTaRTF4r2OdFSj12b5qsrQ8ay2dRpEq/kSU=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=NArmx9lyGyP/ATDOhB5fJ/nvd9wOac+pIgvLzpUeZfILP8vWgiYtngAqd9Bcxoml0gS/gRH9tZswMLWJM65Q8pLZr1JQWrJaPssa3s2FhyKMbpd1BV4AcrR6pYI92mmUmwVFux/e83DA5oaXQ/ZSjGx2b4b1KSx4OtwcGTjaHtc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=AzIbBERo; arc=none smtp.client-ip=212.227.15.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="AzIbBERo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738607029; x=1739211829; i=w_armin@gmx.de;
	bh=APd7PmlYr3tUrzGPQhYI6mm7eQZEmXa+ckllLJyJKpc=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=AzIbBERoKxfSIyW2UeBBKPYOpnZfTFRyVwJEiAGo9TMzt9ASDZvAs0aLvyMCqJjx
	 DjGRtsVS41ZtKZU7UwoVKLdZouH4NvgKJKczTfGzi0goR6K3jxUvsLuFysVvDM9dZ
	 97J7ZfsJ0PBizx7OwCVDrSq7pB8eTFWstjBcK7Co58p3L/OUTZrYzPJHTguLgCvB5
	 5nkqhxqIl55PlZ/FXeXPYe1+i3eSSOIA3ymop6aOq3+cDdnD+OwFuw92ocZcq9/sz
	 +gaTJoYa2FeErYFkm1zqvZOfJoTRfxYrYe9lP5CqU/9wp82Jh2UvYupY5qO0YqWA/
	 O3zU/U9UVa64jHSaSg==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([91.14.238.232]) by mail.gmx.net
 (mrgmx004 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1MaJ7v-1ttAGW1CU9-00Nug4; Mon, 03 Feb 2025 19:23:49 +0100
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
Subject: [PATCH 3/7] platform/x86: think-lmi: Use WMI bus API when accessing BIOS settings
Date: Mon,  3 Feb 2025 19:23:18 +0100
Message-Id: <20250203182322.384883-4-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:DY3+lm6DAuWbuLgtk6U1okZdohu83rfMRMs8o1VVdxTiLWNAKu5
 LAC+Dg5kMa02Hf9q17CSwhMlFvf0eYoMtSmsczqX547KpwE6A8cqD7yHxwHcI/lgzQadsl4
 vyHOU/bYvjE3j4dMW41/ELovMT2LWJVCZMW6w6tJLAOQjDrErJ6xRCLB7Hmu0caMV0dnUdr
 3eSuCnjYwsSXgZRblH3rw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:p/pKXMBedKE=;oBSCRfOJn8LG0j/T6UWFUET2jsI
 SrFozwZ6OoOSZZHjZqg/BdhdDKljoAihhAzqQ40EDhslmtCABDUQNU71R+guFyAX33bWVqRfY
 3B2zNkoPAfvs0iX4l9hyw1YMzU/x3yksloFKEX8YIY7XsxlYk4ZxBItmG/w0PpVa40FyMrn+T
 2a69olQcaY6epym0hKrqFiFVEMVQxEvpGhTFIsBtaYwDBLbOteiJNesn0g0ZRKkrRmKyJbI/c
 UsMhBvoqJk4norcTkc1X0ssn33l8fy+3kcG1FgKWzr7QbMTskOcZmBTsN5cqeavpRbMpFCxkj
 aCwelvYSluMEzYJt7054YVhkWs06+h2MhOBh5drim5PRbNju1ZfhvyBYyKau/Kkh8mTzW98h7
 mKrU56KyeKRRD6M+ZS9jIDgCpQc1iz5hjPttb+MRnve8lVaAbEsRgkWPIb9qytfcrm7HXzUxz
 lupssBVP6Ks7Ez+zynwdWOvnGiKerCN9TCmaw0lj7soDECZxMu2fQrmpVyOfyXX/GLiQikVVY
 O2/4mgAY8X8HNuCqCzQj8n+pY7fXQsAj1TYlCtNn5FyhfeiVqhV5IL5XgPVF5FQXdT/ExvAEd
 X2WV7o98B/Na3t1Ier+FY/luDb3hBocOG9Iz7K2LpgCQPJfgGoJ0HwFf22Yy4UykPosF1+4iB
 TuwrzikahGTzmhEK2t4ufFKGOs55ME1djA32ODuJvxVNb872Vd33/y+8FvJn+56R/xv4dIj91
 TxT2280AKRaduR4ZFEBdnXZcxz7BJbHKQJO/IFP4SoD/hVn91rriUTuQVfJ3qsxJf9oKQmg+r
 4TL40YxKad/+9gXJZ1Nu0R2T6OwhwRi9545jRkigHhLmoszrp4EqdWxdPRdxZumKUUwzB4BV/
 nDsy24HkgXTYbl0dboDIYIJeUp6wcSI5HbdC/EV1QFJ01FFy1ElM37+dMgktok601NRqVYeGo
 S1fU6yoJ3Dqfmt+Mg8n6B8lHPsbOWPkzsP4c30ReRZRFsmGhPACdLH324ev8WI1OMcXHf7lrR
 qDW4THKoaEyYSKHAD1rIyqZ9ZWSCJJnBRNh9tDwAUdDtg3ReA4OFY6ePT10F7JBURTIr/yHT8
 SXSUlD8Qvf83W5z5bS2bnCIKWOB/CLGmRDGMzuVltoCJjkN8F64mND2EKlp5pZWHCkBROu9DW
 zR38fZLU60zkFLRhWTo43K/zgYSaFbpI22G3LYaM4ldPifkXOwaXLH6vli8F50ftyCozpfe33
 M0DG6I0Q2jSqUUi8Rmao1c8HcGW291Kv/l0hRA8HUEdpYlURWNUi+H8XXG32lYIQ50Wn+vXMZ
 YL2Ztj81Q6CH4vwQSNexOmhd9lrSfusZjfc9k2mWd8v59w=

Since the driver already binds to LENOVO_BIOS_SETTING_GUID, using
wmidev_block_query() inside tlmi_setting() allows for faster
access to BIOS settings.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/think-lmi.c | 23 +++++++++--------------
 drivers/platform/x86/think-lmi.h |  2 ++
 2 files changed, 11 insertions(+), 14 deletions(-)

diff --git a/drivers/platform/x86/think-lmi.c b/drivers/platform/x86/think=
-lmi.c
index 2c94a4af9a1d..0fc275e461be 100644
=2D-- a/drivers/platform/x86/think-lmi.c
+++ b/drivers/platform/x86/think-lmi.c
@@ -344,20 +344,14 @@ static int tlmi_opcode_setting(char *setting, const =
char *value)
 	return ret;
 }

-static int tlmi_setting(int item, char **value, const char *guid_string)
+static int tlmi_setting(struct wmi_device *wdev, int item, char **value)
 {
-	struct acpi_buffer output =3D { ACPI_ALLOCATE_BUFFER, NULL };
 	union acpi_object *obj;
-	acpi_status status;
 	int ret;

-	status =3D wmi_query_block(guid_string, item, &output);
-	if (ACPI_FAILURE(status))
-		return -EIO;
-
-	obj =3D output.pointer;
+	obj =3D wmidev_block_query(wdev, item);
 	if (!obj)
-		return -ENODATA;
+		return -EIO;

 	ret =3D tlmi_extract_output_string(obj, value);
 	kfree(obj);
@@ -995,7 +989,7 @@ static ssize_t current_value_show(struct kobject *kobj=
, struct kobj_attribute *a
 	char *item, *value;
 	int ret;

-	ret =3D tlmi_setting(setting->index, &item, LENOVO_BIOS_SETTING_GUID);
+	ret =3D tlmi_setting(setting->wdev, setting->index, &item);
 	if (ret)
 		return ret;

@@ -1588,7 +1582,7 @@ static struct tlmi_pwd_setting *tlmi_create_auth(con=
st char *pwd_type,
 	return new_pwd;
 }

-static int tlmi_analyze(void)
+static int tlmi_analyze(struct wmi_device *wdev)
 {
 	int i, ret;

@@ -1625,7 +1619,7 @@ static int tlmi_analyze(void)
 		char *item =3D NULL;

 		tlmi_priv.setting[i] =3D NULL;
-		ret =3D tlmi_setting(i, &item, LENOVO_BIOS_SETTING_GUID);
+		ret =3D tlmi_setting(wdev, i, &item);
 		if (ret)
 			break;
 		if (!item)
@@ -1648,6 +1642,7 @@ static int tlmi_analyze(void)
 			kfree(item);
 			goto fail_clear_attr;
 		}
+		setting->wdev =3D wdev;
 		setting->index =3D i;
 		strscpy(setting->display_name, item);
 		/* If BIOS selections supported, load those */
@@ -1666,7 +1661,7 @@ static int tlmi_analyze(void)
 			 */
 			char *optitem, *optstart, *optend;

-			if (!tlmi_setting(setting->index, &optitem, LENOVO_BIOS_SETTING_GUID))=
 {
+			if (!tlmi_setting(setting->wdev, setting->index, &optitem)) {
 				optstart =3D strstr(optitem, "[Optional:");
 				if (optstart) {
 					optstart +=3D strlen("[Optional:");
@@ -1791,7 +1786,7 @@ static int tlmi_probe(struct wmi_device *wdev, const=
 void *context)
 {
 	int ret;

-	ret =3D tlmi_analyze();
+	ret =3D tlmi_analyze(wdev);
 	if (ret)
 		return ret;

diff --git a/drivers/platform/x86/think-lmi.h b/drivers/platform/x86/think=
-lmi.h
index f267d8b46957..a80452482227 100644
=2D-- a/drivers/platform/x86/think-lmi.h
+++ b/drivers/platform/x86/think-lmi.h
@@ -4,6 +4,7 @@
 #define _THINK_LMI_H_

 #include <linux/types.h>
+#include <linux/wmi.h>

 #define TLMI_SETTINGS_COUNT  256
 #define TLMI_SETTINGS_MAXLEN 512
@@ -87,6 +88,7 @@ struct tlmi_pwd_setting {
 /* Attribute setting details */
 struct tlmi_attr_setting {
 	struct kobject kobj;
+	struct wmi_device *wdev;
 	int index;
 	char display_name[TLMI_SETTINGS_MAXLEN];
 	char *possible_values;
=2D-
2.39.5

