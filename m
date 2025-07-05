Received: from mout.web.de (mout.web.de [212.227.17.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C374D1EF36B;
	Sat,  5 Jul 2025 20:05:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.17.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751745955; cv=none; b=POaQgCfX9JmFttCab7wket0v0dd0N7A6ww2EG5Y9TQlcFfP1Zb9a+PZqvcP3MYL4luQDaTBHxl60jxpC5bvZqiCStG5oJMQcNaQSLR2rqwhGe1TS5XNzbyrD39gfQe5mjxT4wD2ptw6NEmnI3T2uOgQtJNDgaAYHEA/QLoujSrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751745955; c=relaxed/simple;
	bh=H4Oih1xpGRRS9wYgIQJJeUKl4hM5++mqT3RUXcfQs18=;
	h=Message-ID:Date:MIME-Version:To:Cc:From:Subject:Content-Type; b=nbpg1P17fNIQhVmzH7SxA6/vRn3u3gp4/IDtOi/EaXaLL5kAFI8OoftRtiRljNJc1Znkz2TxOxc6EDbnw+gJmvggYRrA8DF2o8dXSnLbGGBUJAYWDi1zjdTQ88mxeqVQ2CPiODtARByfnslSBVcVfKmOzCKpkJwtcp9ROS7EMsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=lEpC6zLI; arc=none smtp.client-ip=212.227.17.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="lEpC6zLI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1751745945; x=1752350745; i=markus.elfring@web.de;
	bh=9WI02iNbdApOyJWKma6F1fUQwFlmblibjncCeVHDD/U=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:From:
	 Subject:Content-Type:Content-Transfer-Encoding:cc:
	 content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=lEpC6zLIorzRmz/9Y/sqcRYrkfzrMb/5Pti/LK4rg7PGovXMRAuu+sqgAeUQr+vD
	 iH0mbF9uxiy2PBjfiSpbWob+npCX57PLWi8U3jR4SJYy5bQfuONZ1t2THgt0n5a6J
	 3lfV9SfRKXA1ZITKytcm83OJ4fznxjCFUF0CekAyBVUhZ7SXu0znH+ZrjCpXDjrAg
	 mmXXaqNUOewBJSdZPZWTK4ua6m3rjc3mdjnyqm32j4HxoJhhS/gf2NXlLWP+7gxx8
	 UAg9Z0V/xu1SAdtNkkEDhpff6NBkSyC8Dy7tWtB+G+v9QgONMlzvbqRxV2qDsI1oI
	 4U3lwiupHlNrHVhtqA==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.92.242]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1Mty5u-1uoa3w3lXg-012Twu; Sat, 05
 Jul 2025 22:05:44 +0200
Message-ID: <30a3a2b1-deef-4f3f-b7da-4164360190ed@web.de>
Date: Sat, 5 Jul 2025 22:05:44 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB, de-DE
To: cocci@inria.fr, kernel-janitors@vger.kernel.org,
 Julia Lawall <Julia.Lawall@inria.fr>, Nicolas Palix <nicolas.palix@imag.fr>
Cc: LKML <linux-kernel@vger.kernel.org>
From: Markus Elfring <Markus.Elfring@web.de>
Subject: =?UTF-8?Q?=5BPATCH=5D_Coccinelle=3A_misc=3A_Add_SmPL_script_?=
 =?UTF-8?B?4oCcc2hvd19xdWVzdGlvbmFibGVfY291bnRfbGltaXRfY2hlY2tzLmNvY2Np4oCd?=
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:crTopZG3SyMDw0FZJSlk0C5CfAPMnmELcTzhVoKq+U98/o+GdF8
 IW+o4Fz0X2JsFnxY6wY1VdtvWhMvUmgEBtHWBdhxmo/DAFcdVl4vmAabPNFqOOobCld2FiD
 pXdGcxJIyE2CgI4O1rV+rMeak1ZbHzeJIedJjhPM6Pwh/ZtOAfLNbcTej1x+cx8IrImwkxo
 9cR6PuiuaS//Cfu55aBKw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:+HnbNdr0qPk=;WvG64qlPv0ZWYzmWY89vfj+J6Im
 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

From: Markus Elfring <elfring@users.sourceforge.net>
Date: Sat, 5 Jul 2025 21:46:23 +0200

Some known programming mistakes are repeated.

See also:
* https://lore.kernel.org/all/?q=3D%22Fix+off+by+one%22

* https://wiki.sei.cmu.edu/confluence/display/c/ARR30-C.+Do+not+form+or+us=
e+out-of-bounds+pointers+or+array+subscripts


Thus provide design options for the adjustment of affected source code
also by the means of the semantic patch language (Coccinelle software).

Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
=2D--

A parse check for the operation mode =E2=80=9Creport=E2=80=9D provides the=
 following hint.

=E2=80=9C=E2=80=A6
Grep query
for
=E2=80=A6=E2=80=9D

It seems that such a key word tends to occur in a lot of source files.
Thus this source code search pattern will probably trigger the demand for
special computation resources.
I became curious on corresponding collateral evolution.


 ...show_questionable_count_limit_checks.cocci | 72 +++++++++++++++++++
 1 file changed, 72 insertions(+)
 create mode 100644 scripts/coccinelle/misc/show_questionable_count_limit_=
checks.cocci

diff --git a/scripts/coccinelle/misc/show_questionable_count_limit_checks.=
cocci b/scripts/coccinelle/misc/show_questionable_count_limit_checks.cocci
new file mode 100644
index 000000000000..d565e306711f
=2D-- /dev/null
+++ b/scripts/coccinelle/misc/show_questionable_count_limit_checks.cocci
@@ -0,0 +1,72 @@
+// SPDX-License-Identifier: GPL-2.0
+/// Reconsider questionable count limit checks.
+//
+// Keywords: detection programming mistakes
+// Confidence: Medium
+// Options: --no-includes --include-headers
+
+virtual context, patch, report, org
+
+@depends on context@
+expression limit;
+identifier i;
+statement s;
+@@
+ for (
+      <+... i =3D 0 ...+> ;
+*     i <=3D limit
+      ;
+      <+...
+(     i++
+|     ++i
+)     ...+>
+     )
+ s
+
+@depends on patch disable gtr_lss_eq@
+expression limit;
+identifier i;
+statement s;
+@@
+ for (
+      <+... i =3D 0 ...+> ;
+(
+-     i <=3D limit
++     i < limit
+|
+-     limit >=3D i
++     limit > i
+)     ;
+      <+...
+(     i++
+|     ++i
+)     ...+>
+     )
+ s
+
+@x depends on org || report@
+expression limit;
+identifier i;
+position p;
+statement s;
+@@
+ for (
+      <+... i =3D 0 ...+> ;
+      i <=3D limit
+      ;@p
+      <+...
+(     i++
+|     ++i
+)     ...+>
+     )
+ s
+
+@script:python depends on org@
+p << x.p;
+@@
+coccilib.org.print_todo(p[0], "WARNING: Reconsider questionable count lim=
it check once more.")
+
+@script:python depends on report@
+p << x.p;
+@@
+coccilib.report.print_report(p[0], "WARNING: Reconsider questionable coun=
t limit check once more.")
=2D-=20
2.50.0

