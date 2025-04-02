Received: from nix1.peacevolution.org (nix1.peacevolution.org [159.89.94.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE221F2377
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:33:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.89.94.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636823; cv=none; b=XpzvH5Vz1klZeEWMYm8QqVCrzk8UFKFVmGh7zIPXrtz5Ax8zhFjeJ8o1z046OMzsR44v4iAjnhXGck/Bd7X0qHkytq8tGzBaSpW87agPQ0Du9n1KKsjaND44xGCh3HipbtPg2PkDLfouBP5MfFzsBVcSSsAAwV3E3+6NHbQTlCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636823; c=relaxed/simple;
	bh=B81ocLy7n6LM1Oo2r5m9Ud8pj4meMbxLHulaXQ192J4=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HBFluHGGbK0XpGCiuQ1Spu0F4wVTEQzsZv90i0TvHTsN/XX9PjMaoOiEAN+hnZ5LKTyg7x9pPdiKipYscHNqweYWIgJV5hlihF4mvRIaTkTUlnPCFKArHun05BaGgTOHmH3l55OioAqrhQEulzD9XJGzxBcO1XxyaUzQHBz+RFk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org; spf=pass smtp.mailfrom=peacevolution.org; dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b=E27K1Q7d; arc=none smtp.client-ip=159.89.94.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=peacevolution.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=peacevolution.org header.i=@peacevolution.org header.b="E27K1Q7d"
From: Aren Moynihan <aren@peacevolution.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=peacevolution.org;
	s=mail; t=1743636447;
	bh=ElatTB23kjK54XH3ciOgFJuLYKTbQoZaotjymkfK17s=;
	h=From:To:Cc:Subject:Date;
	b=E27K1Q7d24TVBNN+uH6xXmUbrrR5ZXnM2n9y/tMmNUHt7hY8VjDHCvOs/OYCBtAlF
	 ocEm4/C889v7GFMfa2W6A/iGpWbOhc9Do3PAAlrf9C3aT4kGFa7LF5+5VNK4wnD/aQ
	 k4a7ki51P5d64spb1MjBp3WSq/e5XycEEkuoHnKI=
To: Andy Whitcroft <apw@canonical.com>,
	Joe Perches <joe@perches.com>,
	Dwaipayan Ray <dwaipayanray1@gmail.com>,
	Lukas Bulwahn <lukas.bulwahn@gmail.com>,
	linux-kernel@vger.kernel.org
Cc: Aren Moynihan <aren@peacevolution.org>
Subject: [PATCH] checkpatch: only check signature styles in the commit message
Date: Wed,  2 Apr 2025 19:22:52 -0400
Message-ID: <20250402232251.734324-2-aren@peacevolution.org>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Patches removing lines ending in "by:" will cause false-positive
warnings about non-standard / malformed signatures. Only looking for
malformed signatures in the commit message avoids this.

Given this patch:
> From: Aren Moynihan <aren@peacevolution.org>
> Date: Wed, 2 Apr 2025 16:34:53 -0400
> Subject: [PATCH] Test commit
>
> This is a test commit
>
> Signed-off-by: Aren Moynihan <aren@peacevolution.org>
> ---
>  test-file.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/test-file.c b/test-file.c
> index 1527673..71c7e44 100644
> --- a/test-file.c
> +++ b/test-file.c
> @@ -1,3 +1,2 @@
>  int foo() {
> -err_standby:
>  }

Before:
> WARNING: Non-standard signature: -err_standby:
> #19: FILE: test-file.c:1:
> -err_standby:
>
> WARNING: Use a single space after -err_standby:
> #19: FILE: test-file.c:1:
> -err_standby:
>
> ERROR: Unrecognized email address: ''
> #19: FILE: test-file.c:1:
> -err_standby:
>
> total: 1 errors, 2 warnings, 3 lines checked

After:
> total: 0 errors, 0 warnings, 3 lines checked

A real world example of this can be found here:
https://lore.kernel.org/lkml/20250208211325.992280-4-aren@peacevolution.org/

Signed-off-by: Aren Moynihan <aren@peacevolution.org>
---
 scripts/checkpatch.pl | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 784912f570e9d..a7bb6df8510d1 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -3014,7 +3014,7 @@ sub process {
 		}
 
 # Check signature styles
-		if (!$in_header_lines &&
+		if ($in_commit_log &&
 		    $line =~ /^(\s*)([a-z0-9_-]+by:|$signature_tags)(\s*)(.*)/i) {
 			my $space_before = $1;
 			my $sign_off = $2;
-- 
2.49.0

