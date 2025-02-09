Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BAAE24337A
	for <linux-kernel@vger.kernel.org>; Sun,  9 Feb 2025 20:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739133653; cv=none; b=aHceEc7wZ6HnkTPsceSo3Kynqm0yNy35PlVf9FhF0i3Q5FcWKCglSnJ7I+mDgnb+cfn38rXkB37Z/1L/TuzCXvv7PbFH/HTXNNcMLg5/pUDWLqARcjwce2YXMLcFpHWXBfHF9P9pbFoimeMuEOSXFImxxDRMfSlh7rrf5MALg6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739133653; c=relaxed/simple;
	bh=2gU2/QcKUSQ/wiYWG3ZtCdYIXBDzhN+gWWqdMsOanrQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sp7PloPQeHPtm3maKJ/uPetI9OrEgPfu/fjfXaYXSA3+EyTEStaRv34In/ZtYcfT8Ik3UM6VLAgl26GxVR9iUaxIgjH8qAXD7Z6Y0viMZ4Z3m3uoapp3sicDgOjV5YptLKwZaQ3V2pDLMMjbBBdHTdoO0G8A5v8HrvcAwLgEhao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=EdfSr1DO; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="EdfSr1DO"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-ab7430e27b2so728808866b.3
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 12:40:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1739133649; x=1739738449; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Vq74F1wFcESZ51amFrl8eHD6/YdZmXUP7VjXbw0WJkc=;
        b=EdfSr1DOLAsk2V8hwyJdzIzQ32TFWWOghYxxnrWT1oG2gzfVGMLOYiKbnnHP7H3C0j
         h2kFs5BLBVi2LVT5Rm0z4Rv2YiTEXM4RS9Bvfc2BtNGjpUHngY3CUmQqQ65fPpG/e5QE
         5tQvEqk1qzTDTB3gzD4L8Z89SFk4Eeqceale8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739133649; x=1739738449;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Vq74F1wFcESZ51amFrl8eHD6/YdZmXUP7VjXbw0WJkc=;
        b=ROWRpSBRuuh4ArrnjHrQwOeQRZxyLrfyraj+qT+peh0rJ7FDlWlK1i8KcyHHVw3QsQ
         Rpihy1cvos6VKaDBuBGSSKKHFp/rw3YcZXIXGaSrhy4wHi910WHOwA0mAGUn2Ii3hlqF
         ok/jpsijx9ME2wYPecXCcXq6hF4DyqjSnxci9vo2gvYenKIA+2YWbUjLRLf0/r3EGd21
         U9i/bOXfN9bqgEeyLwX/AatYKDkvwZSY35B9bFl6m7yEUOWxqPRcsM3En5S9hBxI05vk
         wlvrt0dysfi6rNJBRf4iwh64KFCwnJaaTq/H9Pun51l1fWxy5fDLHU1rRBvxNl1mpStQ
         GUVw==
X-Forwarded-Encrypted: i=1; AJvYcCVMmQmfkjDUdb8PSwmPsrJ8VuN4hs3NF04gQlqkJEg5LBQ9DAV4cQr+g8s7jSEj1V1yfPb/jAcgpxxUGS0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzlfwSogGC6xkqNju2qdHJegYJsKXYo0VxAJzKMMUuWB1dnFRHQ
	r1TH0uUTmsJOVgKpG44JLca9hT+g1XWYi9w9Hi3/8ncf01d31oc39kWQ8+KoKJW57aMjnmgh/J0
	XWXs=
X-Gm-Gg: ASbGnct4xb4SsQynU6+iJYagztEnw0gZ3RNlROyi8XsLy2N+oUj5A5/eyXOuRUemuuk
	bw+MiqMtu+F47GaTETFupq4yrBVtC4x+FywVdeEGs20cy4lHS0JpnBqq3+dEzbi7RelrjDMnWTR
	VPDePDTjQioUeX+FilKKvzAA8vhj4NG+nDv+XE9rkQZ5OqTxuuFkR3oCpL+/Dy7qVJP9WcwNTXa
	/n/dTT3LwBbTLY0/jnq3gru6jU9G7yq3Aw4VZGGkycC9iOchtixL2xEZdmT1U5JTEcmsbd+KNBt
	40X8LQMD0+YOJLnnPSgRBVX+AIGNO+LOqLbF8qNfmnOmwLlwElNWx+uchxZEf4G35A==
X-Google-Smtp-Source: AGHT+IG3fhcsMJt2LLJ2GPaItMrKIQHbk40jvhKPzOHd0rduNPYf1ekHt+zmrlMK8nGlqxCStlO3Rg==
X-Received: by 2002:a17:907:6d1d:b0:ab7:83c2:bdb7 with SMTP id a640c23a62f3a-ab789c65fb7mr1182918866b.49.1739133649578;
        Sun, 09 Feb 2025 12:40:49 -0800 (PST)
Received: from mail-ed1-f50.google.com (mail-ed1-f50.google.com. [209.85.208.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab77cb8e440sm689890566b.101.2025.02.09.12.40.48
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Feb 2025 12:40:48 -0800 (PST)
Received: by mail-ed1-f50.google.com with SMTP id 4fb4d7f45d1cf-5dccc90a52eso6391198a12.0
        for <linux-kernel@vger.kernel.org>; Sun, 09 Feb 2025 12:40:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCX12rShBLdpBWjIScRtEc6g9tG09ADYqgdde5e6SnwV0xGiMD60zoYd7q+nQ7GaXJOvFSOTm0qmxU6tHE4=@vger.kernel.org
X-Received: by 2002:a05:6402:3589:b0:5de:5d4a:9f56 with SMTP id
 4fb4d7f45d1cf-5de5d4aa093mr7276032a12.31.1739133648266; Sun, 09 Feb 2025
 12:40:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250209105600.3388-1-david.laight.linux@gmail.com>
 <20250209105600.3388-2-david.laight.linux@gmail.com> <CAHk-=wgu0B+9ZSmXaL6EyYQyDsWRGZv48jRGKJMphpO4bNiu_A@mail.gmail.com>
 <20250209194756.4cd45e12@pumpkin>
In-Reply-To: <20250209194756.4cd45e12@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 9 Feb 2025 12:40:32 -0800
X-Gmail-Original-Message-ID: <CAHk-=wisZo7+-xmC_o8GQJ-G0qFp4u29t_FkjgPvgq7FXaTyDg@mail.gmail.com>
X-Gm-Features: AWEUYZnm-byqLtVgoG1xZKmNlSCIlTB0Vzbhmfc7swHQWKbOulXf3f_pjqQ0pEk
Message-ID: <CAHk-=wisZo7+-xmC_o8GQJ-G0qFp4u29t_FkjgPvgq7FXaTyDg@mail.gmail.com>
Subject: Re: [PATCH 1/2] uaccess: Simplify code pattern for masked user copies
To: David Laight <david.laight.linux@gmail.com>
Cc: linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Sun, 9 Feb 2025 at 11:48, David Laight <david.laight.linux@gmail.com> wrote:
>
> You almost need it to be 'void masked_user_access_begin(&uaddr)'.

Maybe we just need to make it a two-stage thing, with

        if (!user_access_ok(uaddr, size))
                return -EFAULT;
        user_read_access_begin(&uaddr);
        unsafe_get_user(val1, &uaddr->one, Efault);
        unsafe_get_user(val2, &uaddr->two, Efault);
        user_read_access_end();
        ... all done ..

Efault:
        user_read_access_end();
        return -EFAULT;

and that would actually simplify some things: right now we have
separate versions of the user address checking (for
read/write/either): user_read_access_begin() and friends.

We still need those three versions, but now we'd only need them for
the simpler non-conditional case that doesn't have to bother about the
size.

And then if you have user address masking, user_access_ok() just
unconditionally returns true and is a no-op, while
user_read_access_begin() does the masking and actually enables user
accesses.

And if you *don't* have user address masking, user_read_access_begin()
still enables user accesses and has the required speculation
synchronization, but doesn't do any address checking, because
user_access_ok() did that (and nothing else).

That seems like it might be a reasonable compromise and fairly hard to
get wrong (*)?

            Linus

(*) Obviously anybody can get anything wrong, but if you forget the
user_access_ok() entirely you're being wilful about it, and if you
forget the user_read_access_begin() the code won't work, so it seems
about as safe as it can be.
