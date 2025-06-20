Received: from mail-yb1-f182.google.com (mail-yb1-f182.google.com [209.85.219.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65FE9242927
	for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 23:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750460520; cv=none; b=ZM5bm01gTXgrGpfX3NjaXseJ+kZlFQNQnUYsRNfarycqwwvPHUPrROi8hnnrW7Zq6i8tS2IlyWkwG1eylnKf3rgwcvR6F5/xaKPbu62l4NEhUAmY4WC8UfpsZ2wKL0JC34ExMdAoz91NTO3JEnHRsjz3QDLWekRg7jsVY2+iYrA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750460520; c=relaxed/simple;
	bh=1zDua3kfs+AWNrJS2QHWoGx4JHS3YgeHabYItBYVWXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XJzplWWsxhkdUZIkIwdwKcFZ0bS+SVCDIM/dH4vP7Mi9gMZc6pUecD+XKeBYEETiuldpKdQWlKAjKXxtxdvyX4OYVgbFBmXJBM5NEOaiOjd4YbEnfZaeHVWLpP/5Cma2a2SvnCpxCUEDZ32wL1ihHnKUnZXdGngt+gUA7wUujSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nON1KO5Y; arc=none smtp.client-ip=209.85.219.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nON1KO5Y"
Received: by mail-yb1-f182.google.com with SMTP id 3f1490d57ef6-e818a572828so1774419276.1
        for <linux-kernel@vger.kernel.org>; Fri, 20 Jun 2025 16:01:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750460518; x=1751065318; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d54D6hE532iClrbhRqB5gQBbclVOCF7XOr3ODdKOfkU=;
        b=nON1KO5YMuLGSn1JmqYhWY9c3R3tD5xmS0XxK5SicNUBVP6/2KfviKo2cbAql7Azhg
         9zrQN766wxBYbua4N5QjEKU1icP2AIFr6QHi4G85Owno8+uFWciRYNOBkwIJvWQ/VcXV
         bRqMsRy35vd8LgYzRo4Hgh6AWGndjn7M+N5pWA3fIWmBBS4cvkA9rcqF6bOzo18CFH43
         HhdJVTl7x3PNEcamfVSE9ThO0vEj4v0SjqkDKElzJ3Z7pbC0RcDtsxEsmQOwJszkd4wz
         uitaZLdoQTNhzc7SgP0lQnAAa/7FgigCeR7A+Ws9Nl/WQV78aj+5IZU6WbPCUKcj5Klc
         RANg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750460518; x=1751065318;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d54D6hE532iClrbhRqB5gQBbclVOCF7XOr3ODdKOfkU=;
        b=Mr7ZFY6aT7V86gC7My+9Na3Pt8CZ6DwKGRv22ZjG2nrCoi3SHYWUnm1A/5YuU+oF/r
         VkYRq4h/oiQ7dnAjAShZXrBNW0j1LNisHKrSyiKg3EXxaTwKXzBGGepqMB9e8QC/ZLsA
         B9kFZKpB6n1HYkf1JeSUsWQ+Rw7Nsrt7HaeTVOfKMlzcAwluuPEDlq93fVdlJFCPlS3l
         K9O5Ko+P/rUyk6uQpIaYBSE1oXR1wgs6NUpjDFcZa87cysYJNJRval5c3DevnjffzVzu
         Rnlr33KAXx0/1Uk+9/g5g+hOMYAwNmJYon9ahOEm3S0yfFYUV/QfK/2dzONNAlZ9xdr5
         wuPA==
X-Forwarded-Encrypted: i=1; AJvYcCV1GWRm1l7VECsP6eziGl0bL/pyWds0IjhOH6Qi1O/mrTvB7BLx4GqagADXDZ4CajsWGJkER8si1mY29PI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwduXDCRlt7QWHQxEtpnwRhcTn8yslGrI9te/tnnc/hTDTr4ots
	Iyfb/1f/L9UdTCZKWDWbcEsRPILjNE8UMnPAv0/V9JtGdPlYf3l9jPG9
X-Gm-Gg: ASbGncvzKsFPVCBA3kt5fTzkWsDHVlycaGWuVqtA0GWs91wEW+BCX3Ie1AuPk077XLs
	yNHosIIFBLBBNkBMKem/g7QrvB9QenP4xTw2Eu2aKdp2P6BbBgbDckCgQxe0p2jw67rt3uG3KAd
	AjBe4ANVdNkvYhDyhZLh6Xl6N5oetjCMXXoduOmPQcSTHJfoZXz4qTRf7v5t2zRTFGP8KEFCtCf
	cxPxE/nZbdNlHDL6X5OFj06XSzQDLCe2xh2pS47LXRmQQefo1oECSeniBeQSycjg6jiKt0/mmhK
	wgb6nnRy9033FXeq6lt+SJjgyLIvZnK2SLwwQXgpGOqCs8XrF5kcP5T7UvwmhDt5JzQKXrjVIV7
	DTQ==
X-Google-Smtp-Source: AGHT+IEYnfAsarGvjhUKLVc06gyJ6C+12pvVnF47nOegJohz0xkXS9e+NgVaDChg/KSmyB9JBuTSfQ==
X-Received: by 2002:a05:6902:200b:b0:e84:1bca:f21d with SMTP id 3f1490d57ef6-e842bcf2509mr6789860276.25.1750460518156;
        Fri, 20 Jun 2025 16:01:58 -0700 (PDT)
Received: from Slackware.localdomain ([191.96.150.102])
        by smtp.gmail.com with ESMTPSA id 3f1490d57ef6-e842ac984b4sm893270276.48.2025.06.20.16.01.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Jun 2025 16:01:57 -0700 (PDT)
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
To: dan.carpenter@linaro.org
Cc: Bhaskar Chowdhury <unixbhaskar@gmail.com>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/9] Looks nicer in usage output without the full path of the script
Date: Sat, 21 Jun 2025 04:08:51 +0530
Message-ID: <afef23e087d4ea73b1700b1effacdcaa46663d35.1750459100.git.unixbhaskar@gmail.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <cover.1750459100.git.unixbhaskar@gmail.com>
References: <cover.1750459100.git.unixbhaskar@gmail.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add basename to scriptname for the clean look of the output.

Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
---
 smatch_scripts/build_kernel_data.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/smatch_scripts/build_kernel_data.sh b/smatch_scripts/build_kernel_data.sh
index 87f1f0639c55..c338da6e43e4 100755
--- a/smatch_scripts/build_kernel_data.sh
+++ b/smatch_scripts/build_kernel_data.sh
@@ -6,7 +6,7 @@ PROJECT=kernel

 function usage {
     echo
-    echo "Usage:  $0"
+    echo "Usage:  $(basename $0)"
     echo "Updates the smatch_data/ directory and builds the smatch database"
     echo
     exit 1
--
2.46.3

