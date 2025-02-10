Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E95B24FBFC
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 17:38:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739209089; cv=none; b=HQsOtfUmFtuLrbKZiUJ+hxYHtFZjBaDGewv0HMHXAhko2q3ZdPRvyN7CZqMA7vdLjKPdfktdt4E8WU9sU5Plngvw1O2EPNI2znSiVuetjnLLPt1a4B8yizdTzMxXUsoUqjn9p4yo+LCbiR2wbYoGmdsCnUSn2wsUlQC91YPfvKc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739209089; c=relaxed/simple;
	bh=KveOwdYLnyMvdHPkIhUVg6hHWpjgSHD3jdqobeFCKGg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XpszghuVgpOjsYabblzUJtozblmkhNK3gRNoogJKrc+qJQ43DHnYzKdr5z5rsA3kXf+EZs3x+11I+mNyl1MVQF4spjIfOU+Y7q2XDD/jJzt3Kcx0MaiJs1HcPfwQJxLMd84SNTndFfifjAJ3Iu2nZuC3kclH4f2m6X59COO4z+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=RBdcAMvz; arc=none smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="RBdcAMvz"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5de5a8a96abso3992491a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:38:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739209085; x=1739813885; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=qVjjNIhYDEU4EznaGkWhHigqbNvzcXCKCHwh1pZR13Y=;
        b=RBdcAMvzAkdQJ/SrPJ0fpwG8DgCUMqA3DvRvaKs0cHTIuwtnI93NzKAmDCHXgape9H
         ghAyXEEZgrasydMnr79JEw5d4KnUeM362wGyyS2zBo+9XICWyCIWWekTQ7b4zCFOg6AD
         /cLALjQ0B9RddCCzo2S+CWCEfaeTt4Q/odDFo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739209085; x=1739813885;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qVjjNIhYDEU4EznaGkWhHigqbNvzcXCKCHwh1pZR13Y=;
        b=WCYA48EhEioGa/s2bjB1ITYzunxxJNadoQ/xYbEwzpLmfECVrkBKQm7ReUnEP+wO9i
         +LZqjXJ/LsDx4Ic3ibh49ahzjowv/BJOolpXYNjFf0nJ5IlXdNw1yFI2aGMbClcC2xdj
         aqW3oOnD6OBzAgNl/Gqna+EALGJRZPXqV9QfFXVmC8jNywNxrXWxkXF/o7fEIUOP8/24
         AAo26vi4kshUZJWDCFsLpB2lLeDMGQi87zQOtaxfAnxKmn9VReQUqytY+Jc2sFXelhwo
         gZbiZqw/Bj7sK4dvA6L0nOPvlPp4Mt/9q23spporpgvI7rQQ60mTjjebW8//n9KLB1pB
         L5UA==
X-Forwarded-Encrypted: i=1; AJvYcCU0JZd9cuJbXz+caPpKVS1LKebxFaEiME8DXmUCXmXfrjgPxrGsn2i5pSOMCCK/T0unzk92hJTtKKxNXWY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwrRt5z0D9ZojAhFpms9JA57eev6MfJMAjt08DypkYJfmasKy1p
	1ZeiWtVecX+gOwzgD9gzN6wP9Yqvwsv+s03ZWR54zMCwzmiOCsVEkQ0FkDvkgwt8jBakctbEcFo
	/lB4=
X-Gm-Gg: ASbGnctCXGTuK+xo6/Qx6v4Y1uagGLLEfeh8iJorBWGtvvdj9CADwf9SBLVqLaoju47
	/j4905Ozw+CpCc4QEvFRq/THMIAUsMmwT6Re8qY3dem9RBlB966VllyBJCLjBB3H97evaDKf86d
	svTlF0Gef4ESGooMGgFZl2JOnXVMEfA4W7C4mnnPfk9Yde30/nVZ/jjJ+vRQHJ1S+UDcSbhSe51
	/uZRWnSVLr25oMvGbvP6UcOhzPwVY9Z4m7oiGGoxUyZovJdpX/Uo1avysq2HYDDI0ayPXDFmFsf
	lHkfpcw8M/lRAOj7s6q+RUTo8lHSIJIFiNRBSbh+T4ScFiIPhtpO8YmkpfQvHx2brw==
X-Google-Smtp-Source: AGHT+IHkfFFhYVV1gqUI9Fz37kzX+r2FhgOMGNuATAaob9CT8mDhpc8Ub3CSMjnMGMrK1lq25Hrc8g==
X-Received: by 2002:a05:6402:3806:b0:5dc:80ba:dda1 with SMTP id 4fb4d7f45d1cf-5de450026acmr34771589a12.9.1739209085444;
        Mon, 10 Feb 2025 09:38:05 -0800 (PST)
Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com. [209.85.208.41])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5de62512da4sm4544615a12.81.2025.02.10.09.38.03
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Feb 2025 09:38:05 -0800 (PST)
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5de5a8a96abso3992417a12.3
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 09:38:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCV5kE3iGKF/yqUdN4ugnJDt8o23eIe6mNMTgc4BVGCNursx/obO0yKD04mwCYV/vK2VGy//ZdQcu+N1aUg=@vger.kernel.org
X-Received: by 2002:a05:6402:5386:b0:5dc:74fd:abf1 with SMTP id
 4fb4d7f45d1cf-5de45017b76mr38928096a12.15.1739209083436; Mon, 10 Feb 2025
 09:38:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209150718.GA17013@redhat.com> <20250209150749.GA16999@redhat.com>
 <CAHk-=wgYC-iAp4dw_wN3DBWUB=NzkjT42Dpr46efpKBuF4Nxkg@mail.gmail.com>
 <20250209180214.GA23386@redhat.com> <CAHk-=whirZek1fZQ_gYGHZU71+UKDMa_MYWB5RzhP_owcjAopw@mail.gmail.com>
 <20250209184427.GA27435@redhat.com> <CAHk-=wihBAcJLiC9dxj1M8AKHpdvrRneNk3=s-Rt-Hv5ikqo4g@mail.gmail.com>
 <20250209191510.GB27435@redhat.com> <b050f92e-4117-4e93-8ec6-ec595fd8570a@amd.com>
 <20250210172200.GA16955@redhat.com>
In-Reply-To: <20250210172200.GA16955@redhat.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Feb 2025 09:37:47 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj8V1v6QmJ_8X6zznautRq29tXMYzxorOniFx4NtxRE1A@mail.gmail.com>
X-Gm-Features: AWEUYZmJaL8TbJ7lk4Lr0c0O26PwdykcaxCrEyPDuubQIkvHJrL2OOK5W6KVmlM
Message-ID: <CAHk-=wj8V1v6QmJ_8X6zznautRq29tXMYzxorOniFx4NtxRE1A@mail.gmail.com>
Subject: Re: [PATCH 1/2] pipe: change pipe_write() to never add a zero-sized buffer
To: Oleg Nesterov <oleg@redhat.com>
Cc: K Prateek Nayak <kprateek.nayak@amd.com>, Christian Brauner <brauner@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, David Howells <dhowells@redhat.com>, 
	"Gautham R. Shenoy" <gautham.shenoy@amd.com>, Mateusz Guzik <mjguzik@gmail.com>, 
	Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>, Oliver Sang <oliver.sang@intel.com>, 
	Swapnil Sapkal <swapnil.sapkal@amd.com>, WangYuli <wangyuli@uniontech.com>, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 10 Feb 2025 at 09:22, Oleg Nesterov <oleg@redhat.com> wrote:
>
> +               int avail = PAGE_SIZE - offset;
>
> -               if ((buf->flags & PIPE_BUF_FLAG_CAN_MERGE) &&
> -                   offset + chars <= PAGE_SIZE) {
> +               if (avail && (buf->flags & PIPE_BUF_FLAG_CAN_MERGE)) {
>                         ret = pipe_buf_confirm(pipe, buf);
>                         if (ret)
>                                 goto out;
>
> +                       chars = min_t(ssize_t, chars, avail);

If I read this correctly, this patch is horribly broken.

You can't do partial writes. Pipes have one very core atomicity
guarantee: from the man-pages:

   PIPE_BUF
       POSIX.1 says that writes of less than PIPE_BUF bytes must be
       atomic: the output data is written to the pipe as a contiguous
       sequence.  Writes of more than PIPE_BUF bytes may be nonatomic:
       the kernel may interleave the data with data written by other
       processes.  POSIX.1 requires PIPE_BUF to be at least 512 bytes.
       (On Linux, PIPE_BUF is 4096 bytes.)

IOW, that whole "try to write as many chars as there is room" is very
very broken. You have to write all or nothing.

So you can't (say) first write just 50 bytes of a 100-byte pipe write
because it fits in the last buffer, and then wait for another buffer
to become free to write the rest. Not just because another writer
might come in and start mixing in data, but because *readers* may well
expect to get 100 bytes or nothing.

And to make matters worse, you'll never notice the bug until something
breaks very subtly (unless we happen to have a good test-case for this
somewhere - there might be a test for this in LTP).

And yes, this is actually something I know for a fact that people
depend on. Lots of traditional UNIX "send packet commands over pipes"
programs around, which expect the packets to be atomic.

So things *will* break, but it might take a while before you hit just
the right race condition for things to go south, and the errors migth
end up being very non-obvious indeed.

Note that the initial

        chars = total_len & (PAGE_SIZE-1);

before the whole test for "can we merge" is fine, because if total_len
is larger than a page, it's no longer a write we need to worry about
atomicity with.

Maybe we should add a comment somewhere about this.

          Linus
