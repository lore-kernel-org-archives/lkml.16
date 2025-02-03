Received: from mout.gmx.net (mout.gmx.net [212.227.15.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CF4B20E01D;
	Mon,  3 Feb 2025 18:24:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607061; cv=none; b=SgFOZLkF2GND2m79mT8hpVjL6tXU3N+gltywO89v5DhRKeMW6Uf9dcqfvXQJDdx0cpkIi96Jz/++tMWBfGBnw7BVq1F/R0o3U/sfQUh3xoBKeZCQ3Jr08q/ycXbGk2bNhAklGInQQio+vJI/eGaSKgN7KZbdJLb6B3f5gOwV0X0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607061; c=relaxed/simple;
	bh=Ca4htyzMV4BbSbS57tRGc2+Cc0LiM6cUtsp4GcmvYPE=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=owrsy0AA6+TixTuiu7+9hSeEblly0V5pLq2zFlMNrs7A9lxX4fs23Op4CW4WfqOd8LVu4i+Jmg+8JTQixW+DLM0XEPkCEtn3RMobLRSlOI3ItqO/ecNLbKc0FyfFrUm6IPkKFd+hNAr2E5a+142yPXKchfMRYviTmY7CEp8N/cI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=Nm2jCK5N; arc=none smtp.client-ip=212.227.15.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="Nm2jCK5N"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738607031; x=1739211831; i=w_armin@gmx.de;
	bh=486rwmOb89mmDx+Ffk5gLFZ3t0a1l6qw1EFvtUtqR4M=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=Nm2jCK5NvCqPyEQbfz7ZzbgBF7Zdf01TtDru4gqMw1zerTPQMH90G8V/4gZoAchM
	 blqBBljdzfxRCzQDe3SzDedjPu3xrFKkKRgiAag3i8ga8cnklv8Ij/PbZd2r7L+oJ
	 sxEOR2IT2XO/kXmPezGeBuTPgTHzO72saFyQJAPoGTUmklpUbHqPnuaZ/eeQCO4r5
	 TJLtYd1aQozxdj6NNzLEtyCiTRfhDEi0OZYaj5xWNL0yRzilKm3Yx6EnjPnZHyYpC
	 vCcikmst3ubD40euNhA3YZVIg9ojHwCkBNFQHostlYafhs07wjtYPgtc9XpsNf8JI
	 dRreYxLpJE97hVAuGA==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([91.14.238.232]) by mail.gmx.net
 (mrgmx005 [212.227.17.190]) with ESMTPSA (Nemesis) id
 1Mkpav-1t0lKq2nSp-00hOaB; Mon, 03 Feb 2025 19:23:51 +0100
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
Subject: [PATCH 4/7] platform/x86: hp-bioscfg: Use wmi_instance_count()
Date: Mon,  3 Feb 2025 19:23:19 +0100
Message-Id: <20250203182322.384883-5-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:wPh2RmjkIqXcV/quK3A5HjPySVsCQnHikQf23COVoQ1tnNcYBjd
 eQNrW4Sj8nfYYKbfRv6HKvKUDi9x9iMO1+7FSU6Cn7lw7rOMwRU/i5EEBvVfNbIICqaKJtA
 sIvWtN0JTJ8636mIRw6hblup4WT8cH3IcUQGSZwq6KQDhz/fOQujIKUx2PX6hybLsvzIDN8
 nP8h4QGJsJQpc70xddH2Q==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:ly39MgnsuNU=;bX3jGkCRZlZ5SLVr8IX2gUCtIeY
 CkNVk7KzJstlAaGzf7cmxWIR9hYB/jq9NngcShxcCMY9R6pOH/QhGoNu5Mu+z1AMSI1gCcgk/
 6Z1CA8MXywdbzgP5E69FDokWo03xVNdGOsd7l6bfyEXMFkDWsL0dLHX+udABdlNt2S0S1ZByM
 EM/Eql4waQNacPSwNkVmi2S5iyahryLZckedbEPXqd3W/m8r+Z8hGGVfAVdjuo+DZIlnxt1Xv
 ZU0t+zsgP2iB4u1FNUx2avc3UirHEqqZ1T/mXD2f926F7Fb4Ko924SFNFMV1Qi8H+T+Aa4T0N
 cfFRqg4rsBb2ptXH2xjmbbxzD0hHnpEWPUXbCFx4dOTJT20o1YCen9n2q5n82p8stdy6GgEUN
 szRvJ2ys7RtQ+fESAn1/BxLiYoHGwXxTRKJSp0HJnlo8kas47axaee2jnvpvFtUYQ28/0qMaR
 SVLULaFRcWtOJZb3imrpdMb7MqcQWwOMmWPgpKaquxqxJU2HJIc6scOZBT3qP4p7uo3rfFaZO
 82zVY3+ceba3mD8/9x0l0p+UmFVRFYxwFeZ+EU1qWe7lYnkklpbwqL/vy0ePaTRzzG6RmAPMK
 z8ozK3/PfMQx+bhZ4mZfAne4eFYTFTmguRsHbsoR7mJ9EsKJc7rgVYTfNU4qi8+Neh9fxiyON
 QMA/a6po+NiWfBdlrd4ZoH8Dj7W9bOGMaxqsF8J6CxXbOVPTPopm2SKw7lGgc2tGOBFvx13BY
 FC+/GK0v+6M4gQxDyWA2CehgQ2rSfhvo89N9YAFnIYFdGB3nzShtpX1o/flAbmjOteVQwBWTa
 pTk4BON9em1mUeQ6QfaAuKftRSHqJkKYThLo9gI0asM5tYKPDy0zEbTEIClT/EH6fjlAbx4oo
 l3/sCfsE7PRpQLBypyhcwr5iANxz5/GBjZRQIapjxL37F+yN71l/n95nrqaD55eZ/7wZFfrzM
 3nGUSyqJtYEbNe8NUcE1uHTVcru2fqCgfVZ8hPqJREVFYIOHimuVODHt7M5oN6tfoPr5L0B35
 z/6aW3/exQfl0YL6OX92wF12zN8MjrK51PnA0uLdo83/0M/9CGGOi4qa9gQgmJ70f43zjYLgZ
 kvRcJ2iVtNXY6/vGXMyICKKkjPEj1SraByY8koFX0hlsYjsqjzpNdmnrOoGJ4V2zvj6YZ/eH0
 qRlOoMvjxeT7V2u6nquu66c4G55//iGhol0nLnYuTpG02++pNq7fdx81opc37TTOsLiKqw8Fh
 bX4H7o2XgivRNZ5c5ZvkavQ90wCGM43wjKqk3uAfheu850JCq61F6jRV8AkdSRfB8wfdn7SNf
 PoVvBucm3OQil9vcWwWZC4jikwBdEak0VN6igzzW602Qlo=

The WMI core already knows the instance count of a WMI guid.
Use this information instead of querying all possible instances
which is slow and might be unreliable.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 drivers/platform/x86/hp/hp-bioscfg/bioscfg.c | 13 +++++--------
 1 file changed, 5 insertions(+), 8 deletions(-)

diff --git a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c b/drivers/platfo=
rm/x86/hp/hp-bioscfg/bioscfg.c
index 0b277b7e37dd..63c78b4d8258 100644
=2D-- a/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
+++ b/drivers/platform/x86/hp/hp-bioscfg/bioscfg.c
@@ -388,16 +388,13 @@ union acpi_object *hp_get_wmiobj_pointer(int instanc=
e_id, const char *guid_strin
  */
 int hp_get_instance_count(const char *guid_string)
 {
-	union acpi_object *wmi_obj =3D NULL;
-	int i =3D 0;
+	int ret;

-	do {
-		kfree(wmi_obj);
-		wmi_obj =3D hp_get_wmiobj_pointer(i, guid_string);
-		i++;
-	} while (wmi_obj);
+	ret =3D wmi_instance_count(guid_string);
+	if (ret < 0)
+		return 0;

-	return i - 1;
+	return ret;
 }

 /**
=2D-
2.39.5

