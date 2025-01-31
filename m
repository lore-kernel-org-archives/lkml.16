Received: from mail-yw1-f194.google.com (mail-yw1-f194.google.com [209.85.128.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 790521FAA
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 08:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738311692; cv=none; b=WKvEquQobUl3Psc3S4qoSWinnIN6VKAAVEJJX5+DlaCwGehtiwaQC02PYTGtrsEaMaRvOT0wGKTiw39pK9Z8OcKXpHs+bMmD79UkdHMax8y6+r8z5pUImLyust9i6cm7GCErt4+LlthRnPWNAwuoZ5fWyZScr0ZcBZupyG9hdpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738311692; c=relaxed/simple;
	bh=cpzl1xvMzp42qcFOFeAmy2JSr394EShKizuRKhtrkIM=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=ezPMHyLyJ54NxI4LC+hUMTcyp9uVs5A6q9Rm7ZQeSD3LgrETAdFAOoCxE2GkiB9Hz9ZhdSqkOazm99meE2diBhANsJEYMNNfV4oJAFlxMRRSvbvjVEDs1xkvZ9t+y5C1TDHC3CYWazvCOB4OAMLUBE2m9oq4yv2rdXtjqEegSVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BgQopwsr; arc=none smtp.client-ip=209.85.128.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BgQopwsr"
Received: by mail-yw1-f194.google.com with SMTP id 00721157ae682-6f6cc13d103so5345037b3.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 00:21:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738311690; x=1738916490; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Jp0wXF2sas8vt3EGEw919osYfv9qaBNlPRlLJ8lWv8A=;
        b=BgQopwsr0lFU6E9CXRBAIksI53wKz89LnLB9W36NOrZm0q1FFayVL9E2zLODJXjDQ7
         xMNrmNFPJmJKh2Q2uL/q7ntg3bukoThhrCp8u1ldQZslQ6HxusnRQw66Zx5iT5L9bQkI
         1scPjZnBOvvMPT4i7yG5A0PjVCCnzn0KQQLe8ZKT+lvyTBrEeQ07HMv3kYuFzLB2t47p
         966Bs18PULRnrb8lc2cHOTZ9nDCW1xFmHHHA7crJ+aHgC1esRXo/gAk6aADxmp89Kapw
         0ClYywrZekCyHX7ECFB57OyMXvKngTWIilJiJZaa8TUvNOyKZCl0wq+775z6X6ktR+WB
         nGwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738311690; x=1738916490;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Jp0wXF2sas8vt3EGEw919osYfv9qaBNlPRlLJ8lWv8A=;
        b=gP47ycPYeJZ8T/iSSGY0zKuLKU6PY7OdDdgmb5GJSI8oOBEyaJFW+mbbltKqOXnmMf
         AiXyg4673QtPqZUMZaAVK4j/WcdSvN1cWim3otPgLkiXjegYFtGs7s2J1h5snFwR7upx
         CUKvXEJmdcugrS419VcDLWc1zVHzaqoGXpgjNcKwp3EeGqty6Kh9MlRGqXz0VdTURpYr
         tf6GrijPyMa78+FV9323b4ylL2QKRXp1Hdvo4wyFK3mHVVPC8XGwMa30psL0iVx4QVG8
         JANUDtyKe/Qyc27bQ7mNF3CLQWekwBTucs4yEPeDCrQxfIgGoRKnzs5+OjkcE5i/c3F2
         u6Ng==
X-Gm-Message-State: AOJu0YwAhQ//knA6o5S5m+57r9zXt+2HMa7clKMqSp5rkQIUKqBfWgCs
	HcaFhNF1l3BQyR+WMRTL/lPi/HOUN8/fVFGPmg+rLwTIuAe6i3tUuodF8lRQGM/jp1QI13gqMZG
	ArYHwkcDuIYNFGZKWOOozYwAJ05hgVXWepkE=
X-Gm-Gg: ASbGncvwGvvZHtWd71cRFD2VRtjlNc38Xk9UFWuE7V3ix0+7mZzVRkVPrzusd5O8LjN
	FMosFtVZAp3jaxoZ+LwrpVpyz2PLA/RJIaNCpWjONqlW1lAEP2tJnN1jk4a1mHoXs12xRUR7uu0
	nbd7tSpSbS3C2tqDozyN0EJDizeUWqR2U=
X-Google-Smtp-Source: AGHT+IE85pFHaXmhOQJQpvPpW1d9RqHo3VFfhQk14HbLylpK4PjfOuNA5bMmda8YGSZouVAIsqE85CaHPXd2gMd9aHE=
X-Received: by 2002:a05:690c:e08:b0:6ef:c4e3:1837 with SMTP id
 00721157ae682-6f7a8388147mr92142197b3.20.1738311690231; Fri, 31 Jan 2025
 00:21:30 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Amit <amitchoudhary0523@gmail.com>
Date: Fri, 31 Jan 2025 13:51:19 +0530
X-Gm-Features: AWEUYZmHSAizCjI0bjOfUpTCFlcPqB1MRUnl2kyY5uwL6U2UvzgBENkIdodiZD0
Message-ID: <CAFf+5zgU2A4PmOm06Ca654UgLErJbfMTK5XhnR5X2D0Jz2J-SA@mail.gmail.com>
Subject: Advantages of crashing if someone is freeing NULL pointer.
To: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

kfree(NULL) doesn't crash. If kfree(NULL) crashes then we can get few
advantages.

Let's say that we do the following:

kfree(x);
x = NULL;

Now, if someone uses 'x' again then it will crash. Also, if someone
does double free of 'x' again then also the kernel will crash. So, we
can solve two problems in one shot.

The side-effect is that the code now will become:

if (x) {
  kfree(x);
  x = NULL;
}

This will introduce a few more instructions, probably 10 instructions
but 10 extra instructions per kfree() should not slow down the kernel.
I don't think we are calling kfree() very frequently.

If people agree with me then I can make the necessary changes and send a patch.

If people here agree with me then I will also try to get free(NULL) to
crash in the C library - I will talk to them and send a patch if they
agree. But first, I wanted to see if people here agree with me or not.

Regards,
Amit
