Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com [209.85.160.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB49B158DAC
	for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 09:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004103; cv=none; b=qhO5NAqRPeY1XTNlW8jBHDo84ANsvq944z5AS+94KP5TEkMj8u9XwD3n8s8PT42ZqNP/pob7+SnLNTDEmc76e8/e9p/EuUuhqD0Vfx1AjrQ0nOHWOQVxgQzuuC/tw2bwpwms3rLq4DP+aToW+K0VixNPvGGBcqkLfKs6tUKAako=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004103; c=relaxed/simple;
	bh=WQ06cfInUnLKA97xKzt5aHyl3AJCxltnuUTd24moQso=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sTXq+fYM3SyhWC6eG1LsaQ1eFnRWUS9oEpoCEYTsQWRZWKRVE1AAiSlNDd3DN6GTTjOF8dGcAt1MsCoiLN+8FhqY1pG7ZngSoIgvS69h9fKxxIJ3WAT6gSz4us2lAjBd5S6Wx/4Hwq/nS+/O/1WVD0NEoOMxE5QxPGKHMItS8Xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu; spf=pass smtp.mailfrom=szeredi.hu; dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b=N/j9DK9t; arc=none smtp.client-ip=209.85.160.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=szeredi.hu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=szeredi.hu header.i=@szeredi.hu header.b="N/j9DK9t"
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4769aef457bso101425911cf.2
        for <linux-kernel@vger.kernel.org>; Wed, 30 Apr 2025 02:08:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=szeredi.hu; s=google; t=1746004098; x=1746608898; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BhMpF9ZPTtusLyxadlrysDYthg/t1DJyaG/WQBBKCKw=;
        b=N/j9DK9tPFPLqP2NlfnUrhIvVVKASGxMuyOpkWGPXogR0zrPQVK3sc4DmSjPFte/x5
         owsOhnRhXDJOk8LJogAxkk2xrKkUIBh8prEpNDvF0+Xmf8GEB4+U/413k65waao1P3Du
         8sP9t0VgXW5jTFaU+YCl4YzYAj4QD/o17RiLw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746004098; x=1746608898;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BhMpF9ZPTtusLyxadlrysDYthg/t1DJyaG/WQBBKCKw=;
        b=ZMVC1b7VnrfQscFTkQAAr3xNzPGSAVnz6sov90qwbHTf897qF2TPrpZSrfO2kb/4QJ
         hQCoB0yG9SaTZXIPv7ld2MYE+cBMzEwV2wBnMTUUVGC4KIQ05lWOgoneEJT3+T/Mb43l
         Gxi5P4n1KizBsmJZRYqjREXB406iWj69r1kTQuukebKuP+aVkdU69//gddrkP4fPPgoB
         t/zYRy6KaPweK2CjYGMXvsWdipfBBH3FXF88MbxuiLfaoVTQ7yizu02gs+/W083L97jy
         6yGAih21eUTiP9BIXzXa1j9M11mi17VXGop4cAb4LjDCO7IH41U9RZWDxkNlwqMD/YXQ
         PGOQ==
X-Forwarded-Encrypted: i=1; AJvYcCV1IL7oLcPSkj/n5EmDlgNG7DeMvDydHxp3fmqMJb6nhXViIByQRYEYfbGXOo7zc+Z60ExcEvhLbeefWrg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKgFNazD5IjtXLfmGdJn/ifZTXqbYL6R8A5Jz5tZ18n2VpHwaI
	jZJPsjXcD6SvL0xPpUyjbKntncIhPvuvYNupUSrapP1GJqhrgMaTzQSaYr5Ne88MqNirzJ7g0Zs
	hyhuTAsXDhKMxjJoPgB8gShIETYtn23ELsBnmwQ==
X-Gm-Gg: ASbGncu8yGylVonTHzYFMyWoEbu252cWam6N7rG6p1vyZCdnb6+j1TFZDGzS3bHxGMf
	9u90qAXSM0oS5Y2m3dhPG25ppNP7q+NlJrx8yBC81EZiL7NUnVzuU3F2BLY/aLeZRu+4KZP0Q5B
	yajMniA/JUlxMfMy3a80HyrFW+XRxYzsMODr4O/pQ4L3g3PsdZdGSppPk=
X-Google-Smtp-Source: AGHT+IGVG98iDSdK5lfsXQAEPtB0RBdUTnCRr6rYE2tT58B+Up30VLXz0bmholjrwMFdvFRX0rFvuoOuy5LcMubDIP0=
X-Received: by 2002:a05:622a:544d:b0:476:aa36:d67c with SMTP id
 d75a77b69052e-489c57f93f5mr39719451cf.49.1746004098321; Wed, 30 Apr 2025
 02:08:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250429183850.211682-1-andrealmeid@igalia.com>
In-Reply-To: <20250429183850.211682-1-andrealmeid@igalia.com>
From: Miklos Szeredi <miklos@szeredi.hu>
Date: Wed, 30 Apr 2025 11:08:06 +0200
X-Gm-Features: ATxdqUEpofBZK62vFi7AqnDOQPvWYkOAMkHP_DpJNRC3xvO-qNFpo2CmpBv2h4k
Message-ID: <CAJfpegv=CFjkAXLM26vFc0prGJ18aVeO3j_0LQSh290DQZn_+g@mail.gmail.com>
Subject: Re: [PATCH] ovl: Fix nested backing file paths
To: =?UTF-8?Q?Andr=C3=A9_Almeida?= <andrealmeid@igalia.com>
Cc: Amir Goldstein <amir73il@gmail.com>, linux-unionfs@vger.kernel.org, 
	linux-kernel@vger.kernel.org, kernel-dev@igalia.com, 
	John Schoenick <johns@valvesoftware.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 29 Apr 2025 at 20:39, Andr=C3=A9 Almeida <andrealmeid@igalia.com> w=
rote:
>
> When the lowerdir of an overlayfs is a merged directory of another
> overlayfs, ovl_open_realfile() will fail to open the real file and point
> to a lower dentry copy, without the proper parent path. After this,
> d_path() will then display the path incorrectly as if the file is placed
> in the root directory.
>
> This bug can be triggered with the following setup:
>
>  mkdir -p ovl-A/lower ovl-A/upper ovl-A/merge ovl-A/work
>  mkdir -p ovl-B/upper ovl-B/merge ovl-B/work
>
>  cp /bin/cat ovl-A/lower/
>
>  mount -t overlay overlay -o \
>  lowerdir=3Dovl-A/lower,upperdir=3Dovl-A/upper,workdir=3Dovl-A/work \
>  ovl-A/merge
>
>  mount -t overlay overlay -o \
>  lowerdir=3Dovl-A/merge,upperdir=3Dovl-B/upper,workdir=3Dovl-B/work \
>  ovl-B/merge
>
>  ovl-A/merge/cat /proc/self/maps | grep --color cat
>  ovl-B/merge/cat /proc/self/maps | grep --color cat
>
> The first cat will correctly show `/ovl-A/merge/cat`, while the second
> one shows just `/cat`.
>
> To fix that, uses file_user_path() inside of backing_file_open() to get
> the correct file path for the dentry.
>
> Co-developed-by: John Schoenick <johns@valvesoftware.com>
> Signed-off-by: John Schoenick <johns@valvesoftware.com>
> Signed-off-by: Andr=C3=A9 Almeida <andrealmeid@igalia.com>

Perfect, thanks!

Added these:

    Fixes: def3ae83da02 ("fs: store real path instead of fake path in
backing file f_path")
    Cc: <stable@vger.kernel.org> # v6.7

and pushed to ovl-next.

Thanks,
Miklos
