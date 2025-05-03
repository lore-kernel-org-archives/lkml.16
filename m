Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1132B8834
	for <linux-kernel@vger.kernel.org>; Sat,  3 May 2025 00:27:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746232082; cv=none; b=LWqsAFntT7O4efohvpct38+96NCiULvkSdIjYq+KUTxDPBFFZeUUje778SyJIEEg9s75RsZeExuuS5o6RNRDrb51VNB5e1NP36I3rGhdSd3xb2SHDcKlTVmjxMpztEuqg6tPPddRFe/BS3gvqq129k/an6eQXIW43XmC9jby6bA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746232082; c=relaxed/simple;
	bh=gQqpjFEGTESzcQc3cHLIM8wYkUkAS2w/iH2qcHSYAB8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FIYkjXywFuqzYcuZ+G/DDZEQZhZtscENUEAeiB+gZWuBdU/HCxieSWJvw8CBx+ENWI/Is0wkoeCVO7eVeaWJ8iNcuxWIo4mX8c2e3O+zP3RkrlNmOmt85YknxP45Ee1i+Zq9/4DsbNoWSNH7oR6xsYlrifxUyjK+LNBUKDeZMEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=DNghIuaS; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="DNghIuaS"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-ac28e66c0e1so277449366b.0
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 17:27:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1746232078; x=1746836878; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SaX79mBWYN1pFOTN8Dl1qaA/CePLGz8VEzgUO+DZmtI=;
        b=DNghIuaS//ao7zg4E4bOUfZFfnmVv244bA8LHl0nMILlEc04NXNPtUhhD30uQObJIr
         kJDLufVuQOxX0YFP242/TIJfA1UqgsCVdMIIvXgYdwJ2vAyizsSJihHzZCyiqmIgAswz
         3Si5eyGU2mpGCkHkN6sBCqNOmb9IZz8HHi+mU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746232078; x=1746836878;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=SaX79mBWYN1pFOTN8Dl1qaA/CePLGz8VEzgUO+DZmtI=;
        b=UO9Yreuikof7VUAouNKSBxyBPFnJSDpeN0MpdSQ5cR26Ug3tUb2IqnEo3Coi1UFHRp
         w79mu/M4ki+TTHs5ktTrgnGtUESyMojUBIVk1CCKZjo+7F63fiU2cnFD+xI4FodrBR6L
         8QhFyZjss6n8DXcIz2obV2BlTRutoXopSV2giN0t6op3Ev8oJhoBlMv9dEtFxT1H6Cvh
         121Syqh5+j1dr4+mY6/eWjmiJwheAZnVs32HMWhX/WvAJo9jiDFfo/apHFxbohrkIuNU
         B7fWRLgE52aK/syNBgXtJ2faJftqNvUpTuT0YEnQVgezDoCwLIB4ZhQcdXxwpTShGOpr
         TrsA==
X-Forwarded-Encrypted: i=1; AJvYcCVHfXVbYADmto6MbTK1sSv8lwNTt20cku/7UNSxkvfANxrmY8CJvaqalfaxVbJWYc7ankk2swBHJGbxa1I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxG9LARXad81n/Srym0fbxM0vYsYHkUd2t6lLvi2LG0ZQc461AZ
	WGH6UG2Q2VQvLWwwzoZ0pBO/g5Yz5ar6Kvu4uq15OwNohJh7EF8LJiA9QCd+2jTNtkVMtCsJsIV
	YIIAcDg==
X-Gm-Gg: ASbGncuQNq98g4blAS9ZpGKVGMTHX4gtK4h/XxgEdE5+ytJjdsX4ce5Z+4ZsxI4DhdK
	WZyQU+n0fMZHHxNTT3WMeutaBFdW60cEYwJPImTTFJX3UehMfXln47XIwMV9B2+IIpCdVA7IXdC
	N1jJFowQuse5mjxvLgeh+UT79YnLCvIJKKFudO94a7rdsAwE+UiHN/cGEVucIfZWN/BBq2l8WRi
	W4lUFpDH8Zqvbkca+2DR+v469wijbwALhg12QLDr5/Q4hnMuaptTktKeHQePcWurTDLpjY3eEkj
	MrRIUDENN6K/Qbyl6rw0FGKgrHP82HNI+A3jgkx+vFmJySAydw6a6E071d14Z3TDYg+QYU8Xt6J
	Nt09EYs0JHjtMmh8=
X-Google-Smtp-Source: AGHT+IEdWF/ywnU3RQsmVBpiflYDC/D2j1QWSQhW8c4q4R4TX12vXaHyBCPlOGR1w3C5tgcKTO/4RA==
X-Received: by 2002:a17:907:9904:b0:ac6:f6e2:7703 with SMTP id a640c23a62f3a-ad17ad3aac1mr343941466b.8.1746232078119;
        Fri, 02 May 2025 17:27:58 -0700 (PDT)
Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com. [209.85.208.48])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5fa777c8bbesm1965316a12.22.2025.05.02.17.27.56
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 02 May 2025 17:27:57 -0700 (PDT)
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-5f728aeedacso3844307a12.2
        for <linux-kernel@vger.kernel.org>; Fri, 02 May 2025 17:27:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX8skmjnSCTFAwi0VsNopcSACvVkkCb3YHi1n7NrpZxdvJ4e4gyOZyqinVsLm9ekxJUmw2naBNr9mn96Xo=@vger.kernel.org
X-Received: by 2002:a05:6402:5193:b0:5f6:2758:149c with SMTP id
 4fb4d7f45d1cf-5fa78012829mr4374591a12.10.1746232076465; Fri, 02 May 2025
 17:27:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250502234818.1744432-1-dan.j.williams@intel.com>
In-Reply-To: <20250502234818.1744432-1-dan.j.williams@intel.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 2 May 2025 17:27:40 -0700
X-Gmail-Original-Message-ID: <CAHk-=wgRPDGvofj1PU=NemF6iFu308pFZ=w5P+sQyOMGd978fA@mail.gmail.com>
X-Gm-Features: ATxdqUH-LQIXIc6u6p011Nom2TN3yeXoWHvmWULI7dubRZjGAyvNHQxUJyyztQA
Message-ID: <CAHk-=wgRPDGvofj1PU=NemF6iFu308pFZ=w5P+sQyOMGd978fA@mail.gmail.com>
Subject: Re: [RFC PATCH] cleanup: Introduce "acquire"/"drop" cleanup helpers
 for interruptible locks
To: Dan Williams <dan.j.williams@intel.com>
Cc: peterz@infradead.org, David Lechner <dlechner@baylibre.com>, 
	"Fabio M. De Francesco" <fabio.maria.de.francesco@linux.intel.com>, Ingo Molnar <mingo@kernel.org>, 
	linux-kernel@vger.kernel.org, linux-cxl@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

"

On Fri, 2 May 2025 at 16:48, Dan Williams <dan.j.williams@intel.com> wrote:
>
> +       struct mutex *lock __drop(mutex_unlock) =
> +               mutex_intr_acquire(&mds->poison.lock);
> +       if (IS_ERR(lock))
> +               return PTR_ERR(lock);

I do think you'd want to have some macro to make this less full of
random boiler plate.

I'd like to point out that when I said that thing you quote:

    "You should aim for a nice

     struct rw_semaphore *struct rw_semaphore *exec_update_lock
         __cleanup(release_exec_update_lock) = get_exec_update_lock(task);"

that comment was fairly early in the whole cleanup.h process, and
"cond_guard()" - which then turned out to not work very well - was
actually a "let's try to clean that up" thing.

And the real issues have been that people who wanted this actually had
truly ugly code that they wanted to mindlessly try to rewrite to use
cleanup. And in the process it actually just got worse.

So I don't think you should take that early off-the-cuff remark of
mine as some kind of solid advice.

I don't know what the best solution is, but it's almost certainly not
this "write out a lot of boiler plate".

Now, the two things that made me suggest that was not that the code
was pretty, but

 (a) having an explicit cleanup syntax that matches the initial assignment

     ie that "__drop(mutex_unlock)" pairs with mutex_intr_acquire()"

and

 (b) having those two things *together* in the same place

where that (a) was to avoid having arbitrary crazy naming that made no
sense ("__free()" of a lock that you didn't allocate, but that you
took? No thank you), and (b) was to avoid having that situation where
you first assign NULL just because you're going to do the locking
elsewhere, and the lock release function is described in a totally
different place from where we acquire it.

So the goal of "cond_guard()" was to have those things together, but
obviously it just then ended up being very messy.

Your patch may end up fixing some of that failure of cond_guard(), but
at the same time I note that your patch is horribly broken. Look at
your change to drivers/cxl/core/mbox.c: you made it use

+       struct mutex *lock __drop(mutex_unlock) =
+               mutex_intr_acquire(&mds->poison.lock);

but then you didn't remove the existing unlocking, so that function still has

        mutex_unlock(&mds->poison.lock);

at the end. So I think the patch shows that it's really easy to just
mess up the conversion, and that this is certainly not a way to "fix"
things.

               Linus
