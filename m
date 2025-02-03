Received: from mout.gmx.net (mout.gmx.net [212.227.17.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2F2B20E33D;
	Mon,  3 Feb 2025 18:24:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738607064; cv=none; b=Tg1mTASY4/WiAuM7yDvqOJdnVAqFmMBhrWjX6o+/M2p4vrlAy8C3XKKfBrzucIriNPDm6fWnbZCSrwluGQNPIldO7fL7pOcW8cPgw8J95lyNWjYT+DrLAkLrtJE6woKD5KLg/yyg1leKhvjiqbv35qB6hS0G2EFJ2JZU50CFsvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738607064; c=relaxed/simple;
	bh=HIb6t8E7LQ7JSCBI6Dj5eLaEJ9aC6SKaBsGchOM7ARY=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dZnpURr9zfPs50hxfOuRPtIhcFf9KFncqqu/ppfnFIiTGWIDZHnwEzAe0bHA20MDyM2Hm8uwsaR+ounFesqi+ytse8TTGV+n+x0UxtiKAx4FTQR4U8b6gRrh05+V9Mx9pW7kzmSRXFwJRe33fyi0auz5qdcvZMrUWzxqqSXwGc8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de; spf=pass smtp.mailfrom=gmx.de; dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b=EYhfz47u; arc=none smtp.client-ip=212.227.17.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=gmx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmx.de header.i=w_armin@gmx.de header.b="EYhfz47u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmx.de;
	s=s31663417; t=1738607037; x=1739211837; i=w_armin@gmx.de;
	bh=m5VMaHKaGDZ2JNZWT7Ky6TMwO3RkLaIA2ds+xOAxaFE=;
	h=X-UI-Sender-Class:From:To:Cc:Subject:Date:Message-Id:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=EYhfz47uu3Fq4mSHb0EyWUe5NwdJr2GqZf78dCbPjMoL8GvVSeYM2Nfbcbz+E7YO
	 4lCtG1zSAfEXxDBwssw+2xi7yLL8v9X++eUV3uNEaCtGJ3OOFU1nF9Pzpx5hkeeEt
	 6svKsm221E3J52Tse+E0l/AMN7D/M5pnwNxliJ/wVs8EFFEZp80vVs3UdSfOUXUQs
	 HjgZ/E5/DJ/OhfXEOGZZXeOEWRW2zBt9nZKe31Ls3J9zwcNa8YOEIA5A4xOObo6cu
	 HaO7u8d8rdTdhgWtrb3OsC/Z0MKEdk8ZRe57PR587nesKIUUuXT8Ny0cIuxPeL5Z/
	 XGwWcsDZQPvZ9ZhCSw==
X-UI-Sender-Class: 724b4f7f-cbec-4199-ad4e-598c01a50d3a
Received: from mx-amd-b650.fritz.box ([91.14.238.232]) by mail.gmx.net
 (mrgmx105 [212.227.17.168]) with ESMTPSA (Nemesis) id
 1Mnpru-1t4Lpf01JS-00qf2Z; Mon, 03 Feb 2025 19:23:57 +0100
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
Subject: [PATCH 6/7] platform/x86: wmi: Call WCxx methods when setting data blocks
Date: Mon,  3 Feb 2025 19:23:21 +0100
Message-Id: <20250203182322.384883-7-W_Armin@gmx.de>
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
X-Provags-ID: V03:K1:wJKVaiQ90liEE4ly+HiOLBV2YkrEPWP4bFa7ew7ygtsUik8JC/z
 rxv+Am7Wzw2c1j6LwfxDids/9neF3YXzYJIdS35Kvs1OAukqYvWqMd9WUW8qRbH3txuIVSC
 L6BIiRtuPQTXkXNFeHzbKYKr3YW5vCH/7iwJOBEf7IE2q5/2V28O8646iV7qjzxPw1ZmXHz
 QDvk+rDxm6pu5zOlv3Gdg==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:SMHMKT8+Ssk=;/QSOaX2z6MYhigkkUAVfrXnus3i
 ixDbU9R4DvvfGsHdadyDfmKLrtLGL/IbFuCjkgSS7TY1L2o1bMMCPg7tYB6KnBbDRWx2v966i
 aDtxdvPsXGlKRlJf1dOJ0UyYAWSSGZyTcU9G9KWay0qfESteYNwnIU8v7jJmcd7BeKix+Tca0
 WgXSUV92+4FcjIPw5LKcGOqV+VqQ4iHNh3Bt7YY69m1Wq2axpEWQhztSRd07sKVhcCN/cKScB
 5McWu/jt+fuWGy5bfVqM0TjT2KFnU2F+NBiJ5y8wRRRcKykTDfos2imUM26iYFljqW9FDtbSt
 NmyJw7rfqWu9msIuG93Fe2kBXpuViOFmHGc1oB2DAq8mlGF1RSjeTjZnhOgWejn9F7RJdwUTe
 TFvqSGFEN3kNXNNFUXeIqa9egBwKZ+q1d9PnyHt6d20hFhVSMEv6PgU2/wLCBEOezkhNvMPeO
 o/VWJSk2DOiJxDG37IZzGQ/rQqUNeIofp/w5EDqSRXbxFGVqW/9Ux4gZ9XmgRRTSgb3+GhxHY
 osbHnnJSp9qfID3/yzHc3QsURsI/hIR3qoAw1hfuJPHLYTdSJAOdeOVEFWA1IXqoqrMNcwLKC
 eEaQzo6B3zMDkK9hbzOhB7q90B4vMXcjrh7r/PYdGp68diPNMx8XdzEnvGHZdJedD7hjEelvt
 kC5mUtGq1y8occKRNGh3X/sxXKUeRMuPnvvUODuI36uRjwCVw+5LGAZhKlQTyO4kKEw2K7Ilo
 EnYIJzeOQA7HxYKk73xn1Hz+sB9I4Z5iX8QL1V4hV7fnjW8D1XTTrqUPeVNAJzPpYTk8ztaRu
 MSDu/dCySs2owaN1VoBNq4yX1chDQ6ctPEdC0OFdBSoZBLvDAZ6mIp4oPKQh8e5CLl75tIU22
 bqgc8icpUmJdV8YTrtB9wQ/FoCgxq856wIlXvqdFB6crA+/el350fKDqzLARXmEppUnVHjLwe
 FdHRnA3A3JsB3tFxveSTV6MngZnFRZK9lMGEJ2ef/7ZjEEH1rKJyIUa4wuka8AfTAv/ORO0Qu
 NL6/sifaidndwD7fosPXp6EfBhw54yNqRV26YVrL83cB1pdjk8Xj+exQJXvtCf8F0L3mmrTgi
 9IsVcbmiVdV5rStUAni+8/suvhQdPNnBa7LX7Drk2T+5Wg6aW73qG3Tggsqd9YlD+3E/ZO3hY
 5tgky+383HYiajDjAglmsHyhbu3qlBkxOov1oy7F+W9ijeZFpGnXS9IFgWeKNJY/nQRF+ms7u
 w6NeyvK566i7EV3K3DR/lYw+JNiLCS1WqVdQ9dThFSI/nDa0+D+qOUcnk08WT/WwiEYcnQRGk
 fWfT5X156ao5UIR1KpTdi5wzjzXtYDD5pYYoEQ6+gSl3t4K1Lp3ttBh63LNVyUJTRUNyXTBvC
 wx74tlLfRGbkwdCQ==

After performing some tests with a custom SSDT table available at
https://github.com/Wer-Wolf/acpi-wmi-ssdt i found out that Windows
also enables data block collection even when the data block is
being set.

Emulate this behaviour to avoid confusing the ACPI firmware.
The bus-based API already implements this behaviour, so only the
legacy GUID-based API needs to be changed.

Signed-off-by: Armin Wolf <W_Armin@gmx.de>
=2D--
 Documentation/wmi/acpi-interface.rst | 3 +++
 drivers/platform/x86/wmi.c           | 6 ++++++
 2 files changed, 9 insertions(+)

diff --git a/Documentation/wmi/acpi-interface.rst b/Documentation/wmi/acpi=
-interface.rst
index 06fb7fcf4413..f1b28835d23c 100644
=2D-- a/Documentation/wmi/acpi-interface.rst
+++ b/Documentation/wmi/acpi-interface.rst
@@ -89,6 +89,9 @@ Similar to the ``WExx`` ACPI methods, except that it con=
trols data collection
 instead of events and thus the last two characters of the ACPI method nam=
e are
 the method ID of the data block to enable/disable.

+Those ACPI methods are also called before setting data blocks to match th=
e
+behaviour of the Windows driver.
+
 _WED ACPI method
 ----------------

diff --git a/drivers/platform/x86/wmi.c b/drivers/platform/x86/wmi.c
index 01d4ac480930..2b2e405955cd 100644
=2D-- a/drivers/platform/x86/wmi.c
+++ b/drivers/platform/x86/wmi.c
@@ -461,8 +461,14 @@ acpi_status wmi_set_block(const char *guid_string, u8=
 instance, const struct acp
 	if (IS_ERR(wdev))
 		return AE_ERROR;

+	if (wmi_device_enable(wdev, true) < 0)
+		dev_warn(&wdev->dev, "Failed to enable device\n");
+
 	status =3D  wmidev_block_set(wdev, instance, in);

+	if (wmi_device_enable(wdev, false) < 0)
+		dev_warn(&wdev->dev, "Failed to disable device\n");
+
 	wmi_device_put(wdev);

 	return status;
=2D-
2.39.5

