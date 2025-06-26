Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1668F292B27
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 08:37:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750927070; cv=none; b=tFMIdAPS8FF4WGuqVX6Wa5UyMInr1mA3D1hsx+B3KqxkSeAE+SviXL8tDb49oJRwaQvKFzPUhbIs2tueXOz7Jws8dqi5IYgsXFhODcMwxvC+jZr3i73tV819vz1jCnm7snNX8IL/BhhWbMCVbl+8ZGLH0vqfgueyUUEU0G0tuT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750927070; c=relaxed/simple;
	bh=61NR3+cv2s+s8non1oheMAZjlDoX1CX3MknyPY6bDPQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uBk2fVM2nIbWhaypX0EUJzVRiuxpRTnvqIvDKaecogfNL0wIav5zBNTvDbOgfaweMnltC3NeTfAeEtgKaut7DKBFDswMLEtIkKUOdz421SaFbnDObQbUiwpUGPTezRQpg4JSimK5Dx4JXw+ZDF2E51Uqp4f4lMeoKdppbTcVhHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MKIuUEzV; arc=none smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MKIuUEzV"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-32b7f41d3e6so8061431fa.1
        for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 01:37:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1750927065; x=1751531865; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LOVSm2lxlfvHzHWNA6nGxFDSpaI7yd4pLz8A6iME9uA=;
        b=MKIuUEzVQIcmMdKU3umjnTlK7MaISvXiPxmI9b8x7G4ODEkVKgQay1l9COTq/9+bNO
         FB1XgAscObG5wp+hdLIMG2TWL2oiKbF7w59KJwHq5xxvLLKZz0jn/ftrtA+eIpVr0sRg
         GGX6Lvv5AEQV7FbpMQrMe6pi1CMcfnQicEl8EEvaubcg2hdSnlA1fZmE0tx/zXwv+Rgw
         4CWZfgq4gTEq/yYsjpF4wxn+047j+px8s0A3E207294ZYQMw8kQILB+qulyEKLHIbqir
         nCvloDgir3Hkt/VzosMMSbU5qOBtU7Z7kElhKTL5HDRJzTJFCWfR6nhgu7OFwMrh1E/T
         GZlQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750927065; x=1751531865;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LOVSm2lxlfvHzHWNA6nGxFDSpaI7yd4pLz8A6iME9uA=;
        b=LxjAvMCSZ4M5tIIWGmzoaleSH+VqmTKXDlN684x94drqvm1/5fkXU3I4T/PIp5WEOQ
         JCYDefbpyDem3qtK8g6F0jHL1lcIQHZbUi7XRphD85idqp9BlMcqdQEbhuA5yzMQ3Oum
         nvWVrfykcc6+bMvhecBx0vcacXzTr57dHm1xLnhtpVl6fGjx9M4A56FBltSbRmqZi0GI
         EfSEm7U18ZbXutnT6UxwSzlH4UimCmFkFXELuisfxNr5+mJClJNjgB8CA5gjrVSJsp1C
         jKbqGtB29k+h7ZmvfSuLYrnHrpZ6uPT9icksfLOpHaEIsCV163Fcv/1nim3iWlmMkr8s
         BL+w==
X-Forwarded-Encrypted: i=1; AJvYcCX8fc8fGn/lp7F5YKrvtjkXCaxJnQC/ZjwRqRLRWxZi1K6+EfHHawTa67Su4dEcSnxLzZxi1HYCLLHvLY8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxtQGskshDFW4kTL4ye4lkOV+SK20owGSeLlXeLq6xSfkUJfUaa
	BHv2jNjtlUxm+W3buIKZfv4dr1Q7ECToEP01zruLyCTsuC5VfByEj7pkJPlciI/DfiQUplPGJv8
	83nQhKqgi6EyKNmoYCMNt+st/QzAgW5HJ2gsbsLLFsfKT+xqRskmUgY05
X-Gm-Gg: ASbGnctW6MeU1pfVcQTYJQbhPWHDtQuD6oK3u3hnNmpYNy8JVJQBdmewtANOxgWScUa
	2dHFfvQaNMjQKgX6vLXvel495/BNUvy6z8tzAcSnQTWRl6r+SC/mkfpomuW0mIGpSQ0Z9ESRuCA
	CpLj2T3kd572+hQGQOOl2QETwqPPxVnqx47UWKlSJjXtNGryPTA0AOHjLFPqyzkatrU/Za0L27i
	noEV13UcWbONWU=
X-Google-Smtp-Source: AGHT+IFoce4glEmRfpaGq1cEJXdDdpQIuRzef09xN/mVCcmD+KVlQpUFkduHrAryLe+sJhQ5P60PGjtSCXUKZH3ivEQ=
X-Received: by 2002:a05:651c:4088:b0:32b:871e:9862 with SMTP id
 38308e7fff4ca-32cd0261797mr6223281fa.20.1750927064914; Thu, 26 Jun 2025
 01:37:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aFNYQkbEctT6N0Hb@lappy> <20250623132803.26760-1-dvyukov@google.com>
 <aFsE0ogdbKupvt7o@lappy> <CACT4Y+Y04JC359J3DnLzLzhMRPNLem11oj+u04GoEazhpmzWTw@mail.gmail.com>
 <aFwb_3EE2VMEV_tf@lappy> <CACT4Y+b9u6_wx9BU0hH0L6ogGKN_+R5T7OsgJVFAWm8yeD0E7Q@mail.gmail.com>
In-Reply-To: <CACT4Y+b9u6_wx9BU0hH0L6ogGKN_+R5T7OsgJVFAWm8yeD0E7Q@mail.gmail.com>
From: Dmitry Vyukov <dvyukov@google.com>
Date: Thu, 26 Jun 2025 10:37:33 +0200
X-Gm-Features: Ac12FXzg-OSj1zle3ASePCxnUdh4OCWuOBwquUmVr7PDJNx1ZtzdOjfrL6XnuBI
Message-ID: <CACT4Y+b1Sou9bzhsuJ_LAjwCtynWN1iNRnaUkkTecNWxLUfMUw@mail.gmail.com>
Subject: Re: [RFC 00/19] Kernel API Specification Framework
To: Sasha Levin <sashal@kernel.org>
Cc: kees@kernel.org, elver@google.com, linux-api@vger.kernel.org, 
	linux-kernel@vger.kernel.org, tools@kernel.org, workflows@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 26 Jun 2025 at 10:32, Dmitry Vyukov <dvyukov@google.com> wrote:
>
> On Wed, 25 Jun 2025 at 17:55, Sasha Levin <sashal@kernel.org> wrote:
> >
> > On Wed, Jun 25, 2025 at 10:52:46AM +0200, Dmitry Vyukov wrote:
> > >On Tue, 24 Jun 2025 at 22:04, Sasha Levin <sashal@kernel.org> wrote:
> > >
> > >> >6. What's the goal of validation of the input arguments?
> > >> >Kernel code must do this validation anyway, right.
> > >> >Any non-trivial validation is hard, e.g. even for open the validation function
> > >> >for file name would need to have access to flags and check file precense for
> > >> >some flags combinations. That may add significant amount of non-trivial code
> > >> >that duplicates main syscall logic, and that logic may also have bugs and
> > >> >memory leaks.
> > >>
> > >> Mostly to catch divergence from the spec: think of a scenario where
> > >> someone added a new param/flag/etc but forgot to update the spec - this
> > >> will help catch it.
> > >
> > >How exactly is this supposed to work?
> > >Even if we run with a unit test suite, a test suite may include some
> > >incorrect inputs to check for error conditions. The framework will
> > >report violations on these incorrect inputs. These are not bugs in the
> > >API specifications, nor in the test suite (read false positives).
> >
> > Right now it would be something along the lines of the test checking for
> > an expected failure message in dmesg, something along the lines of:
> >
> >         https://github.com/linux-test-project/ltp/blob/0c99c7915f029d32de893b15b0a213ff3de210af/testcases/commands/sysctl/sysctl02.sh#L67
> >
> > I'm not opposed to coming up with a better story...

If the goal of validation is just indirectly validating correctness of
the specification itself, then I would look for other ways of
validating correctness of the spec.
Either removing duplication between specification and actual code
(i.e. generating it from SYSCALL_DEFINE, or the other way around) ,
then spec is correct by construction. Or, cross-validating it with
info automatically extracted from the source (using
clang/dwarf/pahole).
This would be more scalable (O(1) work, rather than thousands more
manually written tests).

> Oh, you mean special tests for this framework (rather than existing tests).
> I don't think this is going to work in practice. Besides writing all
> these specifications, we will also need to write dozens of tests per
> each specification (e.g. for each fd arg one needs at least 3 tests:
> -1, valid fd, inclid fd; an enum may need 5 various inputs of
> something; let alone netlink specifications).
