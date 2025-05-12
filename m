Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 152B62512D1
	for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 17:34:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747071280; cv=none; b=D29fyccdGjbfnnapkm//47RB99vUKYyWy82NfMopW0S1yKzcPRaIViJ2rJPJNVmuq1VN74Yx4js2HYS4EnU16i3Xjrc/MeE+CcEH0R0a+phlRc269C/l/chXYNK6ZKwbh0oqtmc60hByw5XjLZghsl0wh/tPMvQ7vfH65RM6WVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747071280; c=relaxed/simple;
	bh=g6SZqkjxTlyOZ3zybDJaW5b4FjjB0ZHegr69awn2z8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZGcdmxq4N4g2SvqyTNOQrUwEcUlxnq2ufDnLYKECchhbVHXB9iD9C4+N87WU9hUs9smtAETsJJZ0Iwa2g/iGqwen+mPePamlqsnKvyaCEJEb+7yrf715dZOwCW/dis5Cuj/x6vi78lKGbhEy8yONTgvJEFCQ85lYWy/itFjBCog=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=P4GgZi/5; arc=none smtp.client-ip=209.85.160.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="P4GgZi/5"
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-47e9fea29easo27821cf.1
        for <linux-kernel@vger.kernel.org>; Mon, 12 May 2025 10:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747071278; x=1747676078; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=L32TaVnBXLMdH7kGFVD3fPi99inq6dfjqi5VDLf2qck=;
        b=P4GgZi/520ntqf7rHXXxwoG8Ymo/SWf52J2ourpZNXbzrcjCwB3pqBgyZLhosVy/SJ
         ffXUHwj0wqb2sKBloI/Iqn5yUVu7ijfCE69d6oxmd376q98k9gd0s/86w8i6O+W7zLlh
         S5k8lUbddEaT2GN4SaJuxLbiiNJhT4XmrqS7R5Yp3ndcJOuRnpeQFFHT0L8pJ8AQJzZT
         viiCeOfdWRrZQhXxQQx/gmB3I0CCmGEf/XkkhJViAPXfcEr1KjCj4EyN5C3Fy5eghcS3
         Bd7NkmwJAGPMBujP1Ivwwbo+LuUf5ehLER6PL8xk80MnHzdjQTcNUlnj743AsaEQa285
         dwQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747071278; x=1747676078;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=L32TaVnBXLMdH7kGFVD3fPi99inq6dfjqi5VDLf2qck=;
        b=gEE8Xzd6FrtZ5iFVMwPc2J0aVT5IW5AUX0dbceO30IJrLWDw3ZsIbowO8yLrrlqVXo
         x8nPgVCQS23u3cVJhrbcdjfvXpkDmlLXQEHerxOPmGfAKnmsg3gndCPyip30qL7xyGWB
         4BPlvWIwYytDurVVErvO3aGa8jbMgy44cuiTxgzPvPr/k2BkXd7f5HD4Q9yFGScQlLpp
         YeA1uR/FLoKcOipNat83C4Zjreky2SEnTyzYhdIFZScjnnGuCO2+56bxe8IB/n3ZE///
         d6pHo8TVkqHtINorBsmej2j0rONenNaH38VMbiKKejzRZPWMm8BchzjK4v7CoaTUjtjH
         ghng==
X-Forwarded-Encrypted: i=1; AJvYcCVSowI0UNEonMXzR0xv5452qkJlMWSZNOXKxQ/kHYYP26ZhDvoArL8feA7c98k5v3jM0vNY+vjQTYlTppE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy39S/G9bZjE6sK5C+9XG/b8PxGWmTaELZj5eUlnFgVlN4O4Ho1
	Bjh2GUXWwHwx2YGSuuYaBRcJV5jIzQxI66Cy3EZuY7TDa+T2I0wderxytqeOMNmj7e5acZIfha+
	r4KHGQSwRfBfBA8z4JCj41IBxunV0ijLUzjSp
X-Gm-Gg: ASbGncvY2bgCWbKuF1Y9YdGPwBZObmI1odQwSZC4D6TZAdZT/eVRJnha6ol3fKhbU7f
	UxghSJsj+xTJMA1orD7bj1ig8re8u+sEPsUxPxgPAQQKW0mujsP3YyV3xPN9Gj5duHoZRQm2PcG
	k+uP8FnU1YX9f6X+4VPBNqEWVTb3Nspk5xIs/DpUAEFA==
X-Google-Smtp-Source: AGHT+IGTYkrhUV+DLsh845oG0n/rLmhyxUlaHkQ2b5H0oBWRt3eLZt6UDnXo3F2HT4sInc546Mn5P2nyRxMkvjW1VbM=
X-Received: by 2002:ac8:7dcf:0:b0:47d:c9f0:da47 with SMTP id
 d75a77b69052e-49462f90dd7mr9301381cf.19.1747071277522; Mon, 12 May 2025
 10:34:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250512171922.356408-1-peterx@redhat.com> <20250512171922.356408-3-peterx@redhat.com>
In-Reply-To: <20250512171922.356408-3-peterx@redhat.com>
From: Suren Baghdasaryan <surenb@google.com>
Date: Mon, 12 May 2025 10:34:26 -0700
X-Gm-Features: AX0GCFs7qEHb9TzjpZlu7kdd28NaoL_rPenAPBM0hzPGJ9tZPP4HKos4WSwSBQY
Message-ID: <CAJuCfpGFTKwgS03X2BqeHm0Pjm-7SqVKRQqAf3FYbu1t7P8n9w@mail.gmail.com>
Subject: Re: [PATCH 2/2] UFFDIO_API.2const: Add an entry for UFFDIO_MOVE
To: Peter Xu <peterx@redhat.com>
Cc: Alejandro Colomar <alx@kernel.org>, linux-man@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrea Arcangeli <aarcange@redhat.com>, Mike Rapoport <rppt@kernel.org>, 
	Axel Rasmussen <axelrasmussen@google.com>, Kyle Huey <me@kylehuey.com>, linux-mm@kvack.org, 
	"Robert O'Callahan" <robert@ocallahan.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 10:19=E2=80=AFAM Peter Xu <peterx@redhat.com> wrote=
:
>
> Add the entry for UFFDIO_MOVE in UFFDIO_API.
>
> Signed-off-by: Peter Xu <peterx@redhat.com>

Reviewed-by: Suren Baghdasaryan <surenb@google.com>

Thanks!


> ---
>  man/man2const/UFFDIO_API.2const | 6 ++++++
>  1 file changed, 6 insertions(+)
>
> diff --git a/man/man2const/UFFDIO_API.2const b/man/man2const/UFFDIO_API.2=
const
> index 1c554107a..17ea6f905 100644
> --- a/man/man2const/UFFDIO_API.2const
> +++ b/man/man2const/UFFDIO_API.2const
> @@ -204,6 +204,12 @@ ioctl.
>  If this feature bit is set,
>  the write protection faults would be asynchronously resolved
>  by the kernel.
> +.TP
> +.BR UFFD_FEATURE_MOVE " (since Linux 6.8)"
> +If this feature bit is set,
> +the kernel supports resolving faults with the
> +.B UFFDIO_MOVE
> +ioctl.
>  .P
>  The returned
>  .I argp->ioctls
> --
> 2.49.0
>
