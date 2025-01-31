Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 144A6155C88
	for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 20:07:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738354026; cv=none; b=o+dEOMv0WNGoKy/Ydbri2A7mdcQvOcfMt76ng11JjqLGR02fxiqrQHUqHEfJWCFRHysUNWRHh7OyR54Mm+PkUbkIZcPugC8UCZ790zfAsutDktsX5B1QnxIENSBOUGMs5uYTcsi3usL+HBx7pZ5w/o4S8lGkkpkiOrervnXCARE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738354026; c=relaxed/simple;
	bh=FMQ3sOMKsQB43uj5pNEYT05d5zJRRgzna6CDksmwbeA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r5Sh/jeFusU6TTxK1c+19e5V/T/fLJ2KEADEXbpxH1cwo7WZBAc9apn2E7x8oZ3A5AiDI9tFiN8ZjDoDPAGfqJHPQhftYHLI3bz8j/FXiMUeGLm0DZ4vQkaMH1IosSD6hwpgBQyTwM8rT4BaeS40ia4sOJaE7NZbJTiwvy0wRXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=gVa44gTQ; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="gVa44gTQ"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-385d7b4da2bso2171305f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:07:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1738354022; x=1738958822; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=giWomTFI9TF/E38QchJwLWohYFKLV3+xm+Xcrv6mGrc=;
        b=gVa44gTQbZoG40d03Bye7RzBRQbbi7acH0yzsVVuriNgMHXXjHVhUGuz//NgEFDnBN
         rkaL5OIJGa+/4wl4bpTvYdyg4yKhZF3KP7InnO8D6DOO1aMeZ8ypcSX46hrWyA3jHiyO
         hLvquOYantaup7tKSWTdZAjeZ9DxtarLmBuRE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738354022; x=1738958822;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=giWomTFI9TF/E38QchJwLWohYFKLV3+xm+Xcrv6mGrc=;
        b=LEmKnpgs+v3B+2JWC0xto5EJ0jR7I1W1qwrhKQkpG+66i5HCZMo0eHoxhT05Syay0A
         cXGhQUC3xiZeVoHFVFiuuR7uSimRUYrkSyvi4Yc5HBX0EmA2Tj6z9169RNPhW4dwomif
         6YXHuVlOI+sfPCITDYAQYRpX6r6geyVnSTAPKMdwEBWOOIYaS7/nrukWTVnZEAo/Fknn
         310kLqL35dLcFQ34ueZEx/lwH47iwEU9NB/fmQYOiRY7RI5UedalqeFHWgaQbpOkVKbl
         SnMmue0jconX2RYKfpntVieKJ57yQvhWdMuWlBgKDNXQbf+7evQU+Zf+LVqZ2EgGZyFR
         7Vxw==
X-Forwarded-Encrypted: i=1; AJvYcCXln1otHfXxGog1LBz/jOHp45l8J+DcdDf3mI6hk3DpzBpZ5yMydc5a3U5c6iTX9TiGrYY6b3Rr0a6RJo4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyPdNFfTGc2lDmxRoDfVGPMYOnCZgzCw9hObO3OJN3B1ZAn/euk
	Yt+FXD+oPsppaVtcfUF8hmZ8ybLpPrMWXCPxv/PDLGx6l0NpZP8ykrJLGpzA7OO8vFKta5YDJEb
	ddOk=
X-Gm-Gg: ASbGncvlStVPT2XJrFG0J87Qro0A3njBMFvnpYAFmVhT87YTblqDYOMjvxeLvxcG9X7
	/6dfHlJPs+wBouKBN1pnp7BCXpvm27zkbToxeo2g858QOgW4OLCVKE9a5ZlrgZQVVHdM2BJVROt
	SrbaQy9d60aqTDh2auKHs4zCtd0mgMXnRFwvQk4bN6nK8EEoHCSnO8Iw2S2iWuDMJ7Jn7iVqst9
	4mmKYCSwLLcXjwhTkLt0nhorfiMqlIeQ0Xn5fnLaGzSV1dCw0wpmvDB7Qd+ZdRr3tTXKZLAJoGr
	ZdUoEJtZhkaqE5DjJz2+6R4asDIo8DQ15jBrrymluO8lM2fZrjn4bUpJ3bXMUXEEPw==
X-Google-Smtp-Source: AGHT+IG6dY17LSfQpBCbDenowLxkFibaxRzTyGUQxrns+b2xgLJjbPbNBNiwRhwAgs3Tx5ZFQBbfSw==
X-Received: by 2002:a05:6000:1842:b0:38c:5fbf:10ca with SMTP id ffacd0b85a97d-38c5fbf1211mr7678970f8f.39.1738354022185;
        Fri, 31 Jan 2025 12:07:02 -0800 (PST)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ab6e4a31f86sm347466966b.145.2025.01.31.12.07.00
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Jan 2025 12:07:00 -0800 (PST)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-5d0d32cd31aso3190084a12.0
        for <linux-kernel@vger.kernel.org>; Fri, 31 Jan 2025 12:07:00 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVTGzlrg9VZm6ze9WSUQ0zvNaON+2JCPlfZXLNR9FgMdPlwMR+1kSA53Qmi3ymKT4ygvEV/D4mMxBvXWB0=@vger.kernel.org
X-Received: by 2002:a05:6402:2546:b0:5d0:cfad:f71 with SMTP id
 4fb4d7f45d1cf-5dc5effe67amr28614245a12.32.1738354020481; Fri, 31 Jan 2025
 12:07:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250102140715.GA7091@redhat.com> <3170d16e-eb67-4db8-a327-eb8188397fdb@amd.com>
In-Reply-To: <3170d16e-eb67-4db8-a327-eb8188397fdb@amd.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 31 Jan 2025 12:06:44 -0800
X-Gmail-Original-Message-ID: <CAHk-=wioaHG2P0KH=1zP0Zy=CcQb_JxZrksSS2+-FwcptHtntw@mail.gmail.com>
X-Gm-Features: AWEUYZlc4nE8uEABWPl3kngqh7LgFJ1Rjob1HO3aFikc9cUu0-QUHp6KA_BURuI
Message-ID: <CAHk-=wioaHG2P0KH=1zP0Zy=CcQb_JxZrksSS2+-FwcptHtntw@mail.gmail.com>
Subject: Re: [PATCH] pipe_read: don't wake up the writer if the pipe is still full
To: K Prateek Nayak <kprateek.nayak@amd.com>
Cc: Oleg Nesterov <oleg@redhat.com>, Manfred Spraul <manfred@colorfullife.com>, 
	Christian Brauner <brauner@kernel.org>, David Howells <dhowells@redhat.com>, 
	WangYuli <wangyuli@uniontech.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, "Gautham R. Shenoy" <gautham.shenoy@amd.com>, 
	Swapnil Sapkal <swapnil.sapkal@amd.com>, Neeraj Upadhyay <Neeraj.Upadhyay@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 31 Jan 2025 at 01:50, K Prateek Nayak <kprateek.nayak@amd.com> wrote:
>
> On my 3rd Generation EPYC system (2 x 64C/128T), I see that on reverting
> the changes on the above mentioned commit, sched-messaging sees a
> regression up until the 8 group case which contains 320 tasks, however
> with 16 groups (640 tasks), the revert helps with performance.

I suspect that the extra wakeups just end up perturbing timing, and
then you just randomly get better performance on that particular
test-case and machine.

I'm not sure this is worth worrying about, unless there's a real load
somewhere that shows this regression.

            Linus
