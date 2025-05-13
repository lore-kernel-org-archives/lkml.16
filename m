Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com [209.85.208.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C57631E491B
	for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 07:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747120191; cv=none; b=u6Tf8ORyK7eNbOy7yjPoJnjt6GjoLuz0+0snKDXBtJhkwwepFeI8ewoAH0oAmEHQHz9oTkly6brwpWUJZ9qPhe5TU4ERZmrLQn2dJUXOxFDww28sla70JT4jpy4dG6+bEF7Pzngk218Fuy3yarjEGfoxaqNpep4L0yPn8dSL+k0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747120191; c=relaxed/simple;
	bh=1mpZ6Al8VYmH30IhbiQcuHYfik/qwiV++F2e9dsh+xg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rRLDcD0ZKkO/BTTlDQh6TmQn+tJKGX2827NWZ7jUXyQV4yYSyQyBf6lF92jDy1cpMwI++eFO+LpW2PIkNvifhqCRG19JDe367blrFW1E6LWGg59TPLl9x+TsUCg447Z4C3/Md707i7GgLU/CIT/vSk9bgnqEAb8vn54a3aB3Hh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=sLnx7Gm+; arc=none smtp.client-ip=209.85.208.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="sLnx7Gm+"
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-326b49bed68so55467021fa.3
        for <linux-kernel@vger.kernel.org>; Tue, 13 May 2025 00:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1747120188; x=1747724988; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=dU26nCKlfqylO1Ro80i/l9QTXUmMjT1iaV5kMUWcm5k=;
        b=sLnx7Gm+nNI1HPMEO1ZTtGnqiLCyRENn0FrsKuU1TJAjrTIMK1wzT27e5t9Oq7uvA/
         CE+QDD9MrtdLwY2Clkwr3ZhZZ54f6Obgtl8q04sTQoGrT3j3vJse9tkpyGaM3HieGByL
         OqrM8l5Aj+yUnXAV1K1N4xqre35uQoE3dlXJOMNfbPoXmwh399QJ0+1XYYOBg4BgpGdL
         nQQabuJuGn9jzPJUL8cqoGDeK711aG9p8DgonrWxT0KHuZWkW1LYLAjSn+LiWCzTlRkD
         Civz4nRL1OCxdbQXJ0VkMbdLJCvkEHzd0j66VA7ahXK6EyhihxCkamZavz4swIBp2/Hk
         fr0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747120188; x=1747724988;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=dU26nCKlfqylO1Ro80i/l9QTXUmMjT1iaV5kMUWcm5k=;
        b=M2xuNnLN0OPXUbRykbCTanUlKhD+yV6GOZacefVYaGvvtEWTRivvl87quzc4Sz8PoD
         PM58OF608xHeIxgBlcVNrvUXssKrN/HFhDibUMO+amj3yl+jElBv3cmODH9W5YQFHElL
         8SvE/kof/wAh4rYzVUTxrODQStj9gmW6NNU9RA1KtWecKiHl+QykzlcP45kIS30tTrkb
         DqkUDEunpPcXrOTYcgrbicoEPafwkaNX+9EcfbVvD0LF1NZOYTPUi0QSb9BSLxdTyuZ+
         rGCUc64LIhFzqvBvdfRl3obARzU5rMtbN5vcma/qmgmsrFdy0VBWFcTts1cUxfIiG/D0
         orfA==
X-Forwarded-Encrypted: i=1; AJvYcCUeELwILrG4hvCXzggzGtSd4oV1h1wEsEIJdSZCKcpfdguQfBXLVEGrrWhcyxgQn8gZ+wbGJTJr95W4EvA=@vger.kernel.org
X-Gm-Message-State: AOJu0YyImAJqWWpV7hxjjJ6OdozO0oC4RnDGa1fFRmHKd5PLdNNDzFzZ
	xhFLSvbtdsHsJ+TrzoQt3BCbs/askO4AYvwDqXIBEHIIHyAdFLnfNW/qmMWNBymNcG1nbfafc0B
	dZYtAnYn8neS8Cev88ALmcjm60UYEHsiY781n
X-Gm-Gg: ASbGncuWq4x9s7U8Arir9jW1aVvz+wPKDXwcO918uliie75tBSEkRAOXE+6sa/VPAXM
	oOeYMGFhEyRqFVDd+SCge2vJl5VLcvaSg03xlJPdzMzyUQQ9onqM/rvE8CZx300k+wrUtb8Z5XT
	utJBl45mGGg2g9O1BncgXofwPomkTevuqoedRSsPaEMQ6ovgMo5AWQX2eD/rCaYk4Lwg==
X-Google-Smtp-Source: AGHT+IEQGCUFG8F2adClWkyfpolaZAHpKzA+AxlgXgeCauF/fMcfoLSm4Fl/E23VOtN8xwg7rRFe2SlvA0thNxp+hLk=
X-Received: by 2002:a2e:b8c5:0:b0:30c:518e:452 with SMTP id
 38308e7fff4ca-326c456a617mr54822011fa.13.1747120187684; Tue, 13 May 2025
 00:09:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <2025040820-REJECTED-6695@gregkh> <20250509072033.1335321-1-dvyukov@google.com>
 <2025050940-marrow-roundish-8b98@gregkh> <CACT4Y+aiQcbHfj2rB6pGKevUbUoYwrHMu+aC-xh0BCKE8D-8sQ@mail.gmail.com>
 <2025050924-marmalade-overfill-fc5a@gregkh> <CACT4Y+ZqToLK5R__x8O1ZctsG3wQtRn36JWF2MPRYqY+Zy_CUA@mail.gmail.com>
 <20250509121036.GA92783@mit.edu> <CACT4Y+Z8ANddFCpNHvNqq6u6=s_aWoYPwu_1HmH19OWeLBi47A@mail.gmail.com>
 <20250512144402.GA200944@mit.edu>
In-Reply-To: <20250512144402.GA200944@mit.edu>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Tue, 13 May 2025 09:09:34 +0200
X-Gm-Features: AX0GCFu8VqDkOeuDOaDyQhiTD0oxexAYp7ClLOraLP5sW2t4hTFgnOk2mc388x4
Message-ID: <CACT4Y+as-Uy_BUjLDxfNwC2+78U3kJdaaKL=vbUNMZH9VcLiGQ@mail.gmail.com>
Subject: Re: REJECTED: CVE-2025-0927: heap overflow in the hfs and hfsplus
 filesystems with manually crafted filesystem
To: "Theodore Ts'o" <tytso@mit.edu>
Cc: Greg KH <gregkh@linuxfoundation.org>, cve@kernel.org, 
	linux-cve-announce@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 12 May 2025 at 16:44, Theodore Ts'o <tytso@mit.edu> wrote:
> > This is not even about auto-mount. Let's say I am mounting a flash
> > drive that you gave me, how do I ensure it's a safe image to mount?
> > Removable media, portable drives, and some use cases related to
> > mounting images stored in local files either deal with images with
> > unknown origin, or can't provide 100% guarantee that the image wasn't
> > tempered with.
>
> From my perspective, the answer is simple.
>
> You run fsck -y on the file system image.  If fsck.FSTYP isn't capable
> of sanitizding the file system image to make it be safe, then that
> should be considered a security bug for fsck.FSTYP, and should be
> reported as such.
>
> Does the user not have the latest version of fsck?  Well, they should.
> If they don't have the latest version of the kernel, or any other
> system software in the TCB, then they could be unsafe.  And that's on
> the user.
>
> > Question of resources for fixing is orthogonal to classification of an
> > issue (if it's a bug or not, if it's a security issue or not).
>
> No, but the resources available should inform the trust model, and
> assuming that users should be able to blindly insert any random USB
> thumb drive, or blindly mounting any untrusted file system image, is
> not a trust model that is realistic.
>
> If you want a different trust model, then give me the resources.
> Otherwise, don't try to impose an unfunded mandate on me.  Because I
> will ignore you, for the sake of my mental health if nothing else.

So the current model is that anybody who may have access to the image
is considered the same level of trust as loading unsigned modules,
right?

I just hoped for something at least somewhat stronger. Bugs flagged by
fsck won't require fixing in that model.

It's not necessarily about a completely "random USB thumb drive".
There may be some level of trust + the image passes fsck. E.g. handout
material on workshops (when one needs to distribute X GB to N people,
conference wifi may be not the best option).
Or, insider risk inside of a company where an image is prepared by
another employee.
