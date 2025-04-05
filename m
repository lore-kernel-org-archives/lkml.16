Received: from mail-vk1-f182.google.com (mail-vk1-f182.google.com [209.85.221.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 721D31DA109
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 11:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743851751; cv=none; b=jAcSe2KSlBvYv83QycaJDqwW0heAVBG/1jrlDnYft/nP15qsgRBe8GTQGETlc4Si2joFcsPQC1T6DF1huKjcLZnN+9/VLkJw5Yc23vN7l+4LC3L6kyHBnmOBrAwlF9zXSSyPUUIKI/GlvBV20/YBNGpibWnHN5rTgf771DXpEW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743851751; c=relaxed/simple;
	bh=NrF2CEqTwuXEdbtBq66rFkkpMx1635ei5AerzCO+SzU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CBGEZLKkQCyKLYhooonUY+8iycwcv4isyTF5/OvMuZ9pjTpppC5QyBpcK1oDJeXlkFT/SeWRy2TJpNUwIW1T4cCLUUXEMDuVnijkQS3gg34SwVyWCcLs35mB0RmgSqq6bE8v/wZNM5qdJnfA4INAR1mWPSqI25agqejEC9QJes0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BCvN3B25; arc=none smtp.client-ip=209.85.221.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BCvN3B25"
Received: by mail-vk1-f182.google.com with SMTP id 71dfb90a1353d-5262475372eso1357545e0c.2
        for <linux-kernel@vger.kernel.org>; Sat, 05 Apr 2025 04:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743851748; x=1744456548; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NrF2CEqTwuXEdbtBq66rFkkpMx1635ei5AerzCO+SzU=;
        b=BCvN3B25IdlwID6F7O4MfW76msBXZhdPyH7W61yUniRI9gV7zVfKmFMLMxAuZvD6AY
         GfMIccPyyDONpUYDOXiRXmch5TLGB5hn7yCchiJuKDw9bmMCjYG8rsiP8TocJAiKdLIQ
         SHbZE5l8Va+Kcay+cpldy5igfr7Q+stC0r7aOu13kMRoeaO0tpPbhtd3ETv0quxHLyXU
         CjZsMg7Ik7FxwWptXJfFjmK+gdtwCVfLNfRknIRvFe9yarxi7iEs9yKaKecstveR4x60
         syAhg4sGf3muH+lWhS4YGx9wrtN/MfA1h8y4N67TJoSCWQPebRGEfjjd1TeQfb0ksWfg
         VYTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743851748; x=1744456548;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrF2CEqTwuXEdbtBq66rFkkpMx1635ei5AerzCO+SzU=;
        b=tQAXN0yARvtsaNGsrOVuaF0N58D8YP9v9JhQV+xzKvBbcKkxnQX2GSezosnov23Lle
         1nCRUByukj8tP3PmRJGuMQSwdpbgJyL3LJRQbvOOx05Sc21AzAry/L0tbm/2EO1+PsPT
         XFtCIMtHit2LPHClD414FfuKiiY9anrBxAuzcZjPUq+gZeoMc66GgVTAm8oidTL5Z6kS
         sKDq095rXrxkNKawQmos5XoBdBYt2bB2tvpT3tBmLC1tPnODRsB+LMcjHfSN1I0DTnsM
         ZzT5+jl6wKlURAdZ71HELAybBwT6xL5Fw77M0hgYRYBGwDK63z3ySJ8WdsoQ9k1tMb6V
         63ZQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmu/5mDKbF3iL4Wov4Ntsp8UHxZCn040nWrGwUCnW2mqxDDh6HL4E/HWcBtUyUaMpqexQij/aW93WNa/M=@vger.kernel.org
X-Gm-Message-State: AOJu0YyTT9IHnzwoUIEuzB/LsPl5EAzgyvmUpkdEYtH+yF8fju1bvSmn
	dFzVsCFj/W0IksJNvDGLMpXdGkA62XcyUTEKBPVNR4XWSDVWVUEYCluMI/fyKh+rTN5HdcURzjE
	2HYgKVnaJWgvsJbNr+HcssBy+i1Y=
X-Gm-Gg: ASbGncv3lT0GfpweeDHIusjpYhhcJkeo7s/Ni16wNsp9Jml4RGM9AG44TKXwJQY1Fj3
	f48tXu0uwAlQjpYcHGcK2WYJOTXP2two3EbxrDa7fBX+Uo9kNDJrvhBXWP5rQVb4Itgl57LFZ30
	LthygkRB4CWYt5FgxjiI2mDdKtRzGi
X-Google-Smtp-Source: AGHT+IF+XO7H72mp9nBWh9nuR+u50y75Y6SGC5FpR7Val7PMcolaV9LU+iIqzW4xjbS8fbNZNqXbjiaqIknPpMENavE=
X-Received: by 2002:a05:6122:2506:b0:518:a261:adca with SMTP id
 71dfb90a1353d-52765d6b697mr3141192e0c.8.1743851748233; Sat, 05 Apr 2025
 04:15:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1743723590.git.abrahamadekunle50@gmail.com> <2025040505-blip-mower-bab6@gregkh>
In-Reply-To: <2025040505-blip-mower-bab6@gregkh>
From: Samuel Abraham <abrahamadekunle50@gmail.com>
Date: Sat, 5 Apr 2025 12:15:39 +0100
X-Gm-Features: ATxdqUGKaGa5YZEZwrnLGDoCzWkMJGEwLMILZyPLX1EnBrAJYbZ_j6woBsFy5wA
Message-ID: <CADYq+fZyKSGihR8YbAXbGii9YCy9CG1UcLQUHhD0S7ifsesu-Q@mail.gmail.com>
Subject: Re: [v3 0/1] Unnecessary code cleanup patches
To: Greg KH <gregkh@linuxfoundation.org>
Cc: outreachy@lists.linux.dev, julia.lawall@inria.fr, 
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, andy@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Apr 5, 2025 at 9:37=E2=80=AFAM Greg KH <gregkh@linuxfoundation.org>=
 wrote:
>
> On Fri, Apr 04, 2025 at 01:02:19AM +0100, Abraham Samuel Adekunle wrote:
> > The patchset modifies unnecessary duplicate NULL test on a
> > value in an expression, when the value has been NULL tested in a
> > previous expression.
>
> Nit, the subject line does nto have "staging:" in it, so I don't know
> where this goes.
>
> Also, it really reads as "this is an unnecessary patch" :)

Argh, Not what I meant to say at all :)
Thank you.
>
> And finally, for a single patch, there's usually not a need for a 0/X
> email to describe it, everything should be in just the single patch
> itself.

It initially started as a patchset with modification for three different
drivers, one patch for each driver, but two were dropped from the patchset
for being media drivers.
So I thought I should add the cover letter to the only patch
left in the patchset so details about the changes can be made known.

I've made a note of this. Thanks.
Adekunle.
