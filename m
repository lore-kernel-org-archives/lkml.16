Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02CCDE545
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 17:30:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750959052; cv=none; b=OpwYNuMTunY+jCgYKSxXaCHGD2gbIMcFf95q0l4fD+kbwLfvsiTFaMd6cqM3ir9N+WAhJNQVanuF9jAFcnjg3UqBk2Mw4Ez7vzrRmBojD4ew8UHafvVkmAXz9m4cmhg2KvPVr95QRYSM1nay3+29k8JE8YUA6qMO9vAP1DL6x+E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750959052; c=relaxed/simple;
	bh=QXEFuuQvj8FI0gNfpZFVFFN6+coebnYeRI5ACjOjDUQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=QXzm5Xz1Hb4cxFEctykXw/0rO5ce8ntLHbGX8+QaW3IODkdN26tzCyC4NRCo+EJplVBOSm8ceTE85wPVSoT/WSHCIVW5lrmqAb1L7Ui0TpHGJWUMM9dGcpPdCLNssqIfUuJHZKbd4QN3ise0SKvrSB4vTvL9MhvGGpFSNgKSCII=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=EeVMPYeL; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EeVMPYeL"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-747fc77bb2aso1327788b3a.3
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 10:30:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750959050; x=1751563850; darn=vger.kernel.org;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fNSmz9lOopP+uFghihae5jARs3RsvoLVMrupkzq571o=;
        b=EeVMPYeLfANfQ0/QkCDISPkydMR65RyazKiTG4/rCFasyZnwnQlWU8gsGSkcRKUfMI
         ZiBhXfZtLZhJ2sbkxu2rFUYc93kyJZ2AQkwIIDgXWspA+zh+R+T0qi0Mgz9pGcPjZgai
         i4r6+v5u50FsqQfTGQ/4y+2aBKhYFBN34ZGbvCXsMXkdOc5kcfbOrqejtL6xNAm1PHfJ
         /KGAC0ayqelrwgSpabDglhAtJoXIOT19Gy5SHU+tSY4nkZY0P59soLJAjzcfC2KHIUAI
         YiLw4hJn3BnJG3454GuuqwPIBqz9IIfkD2DrMct5QL6YvN5rly+8t3RVCiJKv8xt0Jkm
         T5CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750959050; x=1751563850;
        h=mime-version:message-id:date:user-agent:references:in-reply-to
         :subject:cc:to:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fNSmz9lOopP+uFghihae5jARs3RsvoLVMrupkzq571o=;
        b=PinitAp2oNSi7UxW0LW9/30uBdLG8S+GtWsQGd1Vnz/2FTEUo8NkU728J11lP5VSee
         c4TNeH+eUxwxYVlpflL1mPCi2qpXFsrZmrcqDM1Y+MlCFohW1IWx1XUd98GqnaIV+KTs
         t/+1y93xkpoWDW46aPsbb8mWgZ4knKK9I73RMpaTKiviccbRERKB+/T33Imq8R2eEPdT
         XxlVAfu+u+1kvsQSWWjvSKbdRLpzJiDxpth/SKlVQJJ5ajVKEZbfSBs+wa2NC6HnLLbE
         mcznw72syfhR3BIsqJDBR9CQBbtltAUserVNI/4BEF3S6geKoyjX4nZ/VdKwz9G/xMXQ
         4YFg==
X-Forwarded-Encrypted: i=1; AJvYcCW6LnnpiIyeEO23IAZ9aYfx+Esg2RPWIVY7U9aB1JXX7ewnmbL4UADuOS8q9mBoQMeL1YClA6gGFH61rsY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw4pCPJ7TWdoLmR7a5UICmN4tKyezoLEnp30a5fXsR/Tt1gSLwS
	lH60hPXFfYTpa7j6NGyf+8tlBNNC9rTmN8+t9u5Epw7ZJE4DYrljs7XQTrjQi9Zt1joP7Hs0E7n
	yH/qfvR6c
X-Gm-Gg: ASbGncuFWPGyyQJerEqm2h3hzGeOnuPDjCLP4Yp4wn/eLmCbGXLt0NFNVkx9AtpWUCL
	vGSafq1TDy9sYfChErb/QXzghJDNLWDAcdrbE+i7tJVx6lBggVxguRjkrjVAMJo+5JkjSEyM7nx
	tOa+ROihAM5XUIXWnzCmruHKcrZWuGoWkoewNoBGxc9XoKD5wYEdYdmm0krQGevKUYdna416RcP
	B6YpuV5k/MnAGrV7oiwU2iUxgi9Nd/0e+xkl6yWiqKyRcdkw9bViSujtjKaNboZdbPftx9gXxYk
	34ibVV1cBKV1qhpw+rf79ZeAMRxs2ZtJS9JvuZfVm0qpUThxRqm81Tsc3E/WHk7yi0/HVLa1slj
	JXwLSmbUOG339ocItqEuUp8w8abYvgkLA39se+lTfThAykd5S
X-Google-Smtp-Source: AGHT+IFLC3wrXZMAkvk15L7zwLyiMaV+FpIPtLhgCVMTuF3FuILbdAvaYv38RYTXmPpZ2YY2eGvjCQ==
X-Received: by 2002:a05:6a00:848:b0:749:b9c:1ea7 with SMTP id d2e1a72fcca58-74af6f4324cmr47642b3a.17.1750959049754;
        Thu, 26 Jun 2025 10:30:49 -0700 (PDT)
Received: from ynaffit-andsys.c.googlers.com (225.193.16.34.bc.googleusercontent.com. [34.16.193.225])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-74af5802d46sm206967b3a.180.2025.06.26.10.30.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Jun 2025 10:30:49 -0700 (PDT)
From: Tiffany Yang <ynaffit@google.com>
To: Dmitry Antipov <dmantipov@yandex.ru>
Cc: Carlos Llamas <cmllamas@google.com>,  Arve =?utf-8?B?SGrDuG5uZXbDpWc=?=
 <arve@android.com>,
  Todd Kjos <tkjos@android.com>,  Martijn Coenen <maco@android.com>,
  linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] binder: use kstrdup() in
 binderfs_binder_device_create()
In-Reply-To: <20250626073054.7706-1-dmantipov@yandex.ru> (Dmitry Antipov's
	message of "Thu, 26 Jun 2025 10:30:53 +0300")
References: <20250626073054.7706-1-dmantipov@yandex.ru>
User-Agent: mu4e 1.12.9; emacs 30.1
Date: Thu, 26 Jun 2025 10:30:40 -0700
Message-ID: <dbx8sejme7gf.fsf@ynaffit-andsys.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Dmitry Antipov <dmantipov@yandex.ru> writes:

> In 'binderfs_binder_device_create()', use 'kstrdup()' to copy the
> newly created device's name, thus making the former a bit simpler.
>
> Signed-off-by: Dmitry Antipov <dmantipov@yandex.ru>
> ---
>  drivers/android/binderfs.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>
> diff --git a/drivers/android/binderfs.c b/drivers/android/binderfs.c
> index 024275dbfdd8..4f827152d18e 100644
> --- a/drivers/android/binderfs.c
> +++ b/drivers/android/binderfs.c
> @@ -117,7 +117,6 @@ static int binderfs_binder_device_create(struct inode *ref_inode,
>  	struct dentry *dentry, *root;
>  	struct binder_device *device;
>  	char *name = NULL;
> -	size_t name_len;
>  	struct inode *inode = NULL;
>  	struct super_block *sb = ref_inode->i_sb;
>  	struct binderfs_info *info = sb->s_fs_info;
> @@ -161,9 +160,7 @@ static int binderfs_binder_device_create(struct inode *ref_inode,
>  	inode->i_gid = info->root_gid;
>  
>  	req->name[BINDERFS_MAX_NAME] = '\0'; /* NUL-terminate */
> -	name_len = strlen(req->name);
> -	/* Make sure to include terminating NUL byte */
> -	name = kmemdup(req->name, name_len + 1, GFP_KERNEL);
> +	name = kstrdup(req->name, GFP_KERNEL);
>  	if (!name)
>  		goto err;

Reviewed-by: Tiffany Y. Yang <ynaffit@google.com>

-- 
Tiffany Y. Yang
