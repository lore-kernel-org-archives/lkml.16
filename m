Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48DB11A2387
	for <linux-kernel@vger.kernel.org>; Sat,  7 Jun 2025 14:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749307198; cv=none; b=MuPA+uKuhJp468Mu1fSF00OOUwMYnDTmj2KE3CoxnXs1Tk9Rw4n/B/WDo9W7S3i1v2O6syc0njONk7HCIhEbO3ERVtZ3cengP0reQfCdq2HQp/6vz7a4EBjrWDbfa2cgq7eWpCN8qcKbAO0leeX3njQ7odq9yA8OE+gREoqfW+M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749307198; c=relaxed/simple;
	bh=0CPsu2w1z0MxEk4CZO8Ok+OQR+8MkqXyWD9JPK65Q+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=MmHbUklZuJHEXOdC9PGwweUVQ3GaEJTRkBRctYtCwc86/+Azfc+wwyFq3flOVGne6541GP/pYLTUI/kEfLXeJLqCjqB9xWVWF15Mlr05JRXzl6GO2oLQpDErezQEMQ6JGkABp4zcczFLP1OTO18aeUdoTMj/0FN86jLKxW7FuU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=aDMPseo/; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="aDMPseo/"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-70e5d953c0bso32130847b3.1
        for <linux-kernel@vger.kernel.org>; Sat, 07 Jun 2025 07:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1749307194; x=1749911994; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lHqv39PDsJJNauBVvC0f9jO64Wr+HDbnLVQoK8iIq1E=;
        b=aDMPseo/jDxUmZ4K5uZueL9yB3r2DmI6oNh3FOV/3TljTBKwb4WVAnoy49SzRDVGA5
         m/8r2IaSUPFo7M0TFA0SO2wrlxdXt5bv9+LGWVfM9NwiNBx0usauO5iN3fxdSyIe4erZ
         EfzO+UaqSmOeG2sNe3OteS1B1BnjjzEIeKl9w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749307194; x=1749911994;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lHqv39PDsJJNauBVvC0f9jO64Wr+HDbnLVQoK8iIq1E=;
        b=up3Zs84C0rlM+NSYuIujAWhsdyLPAzZi3aKnaqId978Xmn9LkO/h8yk7wt7NBUugbS
         o6wDpVIggOaUEawIPhbRSYryMLDvjF+Xzil50ircKK+MExlLhr8UCK5SnSIDppYlq6CS
         MXLn28bieZuhMsLsqJMwFpoT34dVZ69dZhg6MQHZw6bj4qz+Kq6KLS/ZRBhHJgFwWf42
         8LiuR/u2A2Wb6tME/uKj7DW7dI4VkTGnF8ZV5fnfOQNup2MO2N7tPbDfRC+7rfEWvtcs
         aLlJbzUUhOfMxhVkloLvoEjwhwQn3QAJVoxtrmZUKAeEqjQ8B+RsEXdkKRNzlIf1OunM
         jHYw==
X-Gm-Message-State: AOJu0Yw+uJVbH1B2lihCWxD/5Vob8jfQ4rVOqm3ioy6Mdwh5mObOJiBs
	+IFUWxg5gnc76JTNYTDFg80CsLUex4rAVrNlNNpGSXrpkFWvrZWe+yGwm98sybesmFaaMnD4PkG
	SlEAvzgjcH0dekMYSFQQZX0tJD+P7GiCS97KxGG2GcBEDiOOFPjMCyVXn0A==
X-Gm-Gg: ASbGncvv/gZfg0bnHHu67ePPkijKe35uZy6sdoRHEEbuTY2xkXtFu+8YtU5xqszNIsw
	UNBkMDdHwiQ/sbqtvgSGGQ8HzmizPSgBIg4kJ4fCiuXy/LIJl0qXHsepBCDzU5zsZ0kXuZO0ru9
	Twz2e4DJ6UYgEBSh0AegwX9QdmCr7+zCtqrsqddOwydwoswVs/xArbThSZI92Jf2FZbTNRadfNT
	WL8Gg91X7BQU5I=
X-Google-Smtp-Source: AGHT+IGXnLbdTQ7WY5qyr2MwKl55pntZEcHn/Q+8WNYqfpbKBhNFpRmGll0I/fU9W4buHfMSUs8ba72UGYvlnZAAI6Q=
X-Received: by 2002:a05:690c:4982:b0:70a:192d:122 with SMTP id
 00721157ae682-710f771089fmr102515197b3.30.1749307193885; Sat, 07 Jun 2025
 07:39:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <1612150437.134340417.1749275991560.JavaMail.zimbra@nod.at>
In-Reply-To: <1612150437.134340417.1749275991560.JavaMail.zimbra@nod.at>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sat, 7 Jun 2025 07:39:43 -0700
X-Gm-Features: AX0GCFsJZiLqhp1HZhoxRCSdZw1tdEdtzPFkAQHiKsxEvo8cWqyF1tEmjiU5N-8
Message-ID: <CAADWXX-=CvpwaMJLiWMLXbxzN2Y62VrJ7mhwxUmQBVshdzViaw@mail.gmail.com>
Subject: Re: [GIT PULL] JFFS2 and UBIFS fixes for v6.16-rc1
To: Richard Weinberger <richard@nod.at>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-mtd <linux-mtd@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 6, 2025 at 10:59=E2=80=AFPM Richard Weinberger <richard@nod.at>=
 wrote:
>
> This pull request contains the following fixes for JFFS2 and UBIFS:

gmail hates you and this was in my spam folder.

I obviously do check my spam folder religiously and noticed
immediately - but while checking spam is about as religious as I ever
get, that's still not very religious at all.

So while I do tend to notice email that gets caught as spam as part of
my morning ceremonies, I really can't guarantee it.

In fact, often my spam observance is very cursory indeed.

It's not entirely obvious _why_ gmail hates you. There's nothing
overtly wrong with the email, and you have proper spf records. But if
possible, you might want to look into also adding DMARC for the nod.at
domain.

It does look like lithops.sigma-star.at (which is what you seem to go
through) is blacklisted at s5h.net, but I have no idea if gmail cares.

              Linus
