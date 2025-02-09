Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CF8221348;
	Sun,  9 Feb 2025 16:55:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739120135; cv=none; b=aMikvrucdynbSBBeDrmpNt3K2bbmGz/KSu9czDpX88RKjCuML68mT/de5cTS9jhzjcRtppCkRztTbFJsGoeFiG9slRV5xItvA4MneB5xyWg/gMW2I6sIrX4LlF99vov+oVs+Fl74ua999NMmKsqWcA0V5KSsRUvVj5VZK1q7gTM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739120135; c=relaxed/simple;
	bh=eCOLbrEQl6Q8PofZ6oAAOmyrOHt5RHJBqFDV24Mwud4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=gKrogM1eBaBuu+6Xbwi2RjVut0NnILmpAFHFgWf9/x4UAmVCe0oS873dOHdlN5Ip7whOg7dNDOXoQvhYpmjypW9KSPKgAcr8yiHWfNMiaZwzaCgTJHS40qQKctS8rYdchl+ExTOJGlDv8Xtr+PWVl66r8O66eU7NK1Ybgycg5Wg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XlhaW5VF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XlhaW5VF"
Received: by smtp.kernel.org (Postfix) with ESMTPS id A4BDEC4CEDD;
	Sun,  9 Feb 2025 16:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739120134;
	bh=eCOLbrEQl6Q8PofZ6oAAOmyrOHt5RHJBqFDV24Mwud4=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=XlhaW5VF2PwlDSvZJ6i+sR2DyJNLUZmqnuRy+1uj+6ySalY7gy7Oh8fLXv4n6Fhe/
	 MNrQwkhRpgHN1Zq1py9SCtr84RTKIHr1J0orNQGwSmEODWY32kRWq5L/EBQ2A3uq1V
	 0pVo9DgyBCoEIV4rSfTGkVlpk2CiGJG1zfI6Md/kur4OZBNQTjq9AxwT+hL/oBD+cM
	 MpQ7Xtsk9yUzmKp5OYGrt1TIiOdnyg0HMJQGrwxf4NKIjSFbGmZGwL8TFV5PXo78ot
	 FGmbF9QvGoO/ErNMdgLeO+7FKZssWhNb8BSo7fd8Xhj7m442mVaVc24Q3p3VAiYgk6
	 Ys2SYIxhFRzgQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85D86C0219B;
	Sun,  9 Feb 2025 16:55:34 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 09 Feb 2025 17:55:28 +0100
Subject: [PATCH RESEND] scripts/make_fit: Print DT name before libfdt
 errors
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250209-makefit-v1-1-bfe6151e8f0a@posteo.net>
To: Simon Glass <sjg@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739120133; l=2504;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=qNYHUnAZnyBHAWNkYsjAlxvZcMVlVw3UbvcsQUL+fy8=;
 b=wes9wYfXwUGeWcaAUCu5kNs9CIRC4rXfWm7xTK2sserLOYrdIsz035w6eRJCAu9HPXjuGFcPu
 XXRyQ0UxUh3B2Gh1qwiZRLDA2mTnDEc830lGFG9jdndtFQphIiX7FgJ
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
Reply-To: j.ne@posteo.net

From: "J. Neuschäfer" <j.ne@posteo.net>

This makes it easier to pinpoint where the error happened. For example:

  FIT     arch/powerpc/boot/image.fit
Error processing arch/powerpc/boot/dts/microwatt.dtb:
Traceback (most recent call last):
  File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 335, in <module>
    sys.exit(run_make_fit())
             ^^^^^^^^^^^^^^
  File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 309, in run_make_fit
    out_data, count, size = build_fit(args)
                            ^^^^^^^^^^^^^^^
  File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 286, in build_fit
    raise e
  File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 283, in build_fit
    (model, compat, files) = process_dtb(fname, args)
                             ^^^^^^^^^^^^^^^^^^^^^^^^
  File "/home/jn/dev/linux/linux-git/build-mpc83xx/../scripts/make_fit.py", line 231, in process_dtb
    model = fdt.getprop(0, 'model').as_str()
            ^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/libfdt.py", line 448, in getprop
    pdata = check_err_null(fdt_getprop(self._fdt, nodeoffset, prop_name),
            ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
  File "/usr/lib/python3/dist-packages/libfdt.py", line 153, in check_err_null
    raise FdtException(val)
libfdt.FdtException: pylibfdt error -1: FDT_ERR_NOTFOUND

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
The example is from a different series which I will release soon, which
enables FIT on powerpc.
---
 scripts/make_fit.py | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 4a1bb2f55861adfce07959528e175260bc503593..1683e5ec6e6754dff3383dfec89df78b9c2fa896 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -279,7 +279,11 @@ def build_fit(args):
         if os.path.splitext(fname)[1] != '.dtb':
             continue
 
-        (model, compat, files) = process_dtb(fname, args)
+        try:
+            (model, compat, files) = process_dtb(fname, args)
+        except Exception as e:
+            sys.stderr.write(f"Error processing {fname}:\n")
+            raise e
 
         for fn in files:
             if fn not in fdts:

---
base-commit: 4bbf9020becbfd8fc2c3da790855b7042fad455b
change-id: 20241224-makefit-31f789b9ee4f

Best regards,
-- 
J. Neuschäfer <j.ne@posteo.net>


