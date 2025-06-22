Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3B94EC2
	for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 16:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750611462; cv=none; b=DlY2aofJffy7Dm6c2r4BhOpb5p5CU1He/x/k9sYPV78bZz9Hoz7lIXJVQ4UUQpvb4B5OfhuAwajhYR98WMO3Wj11Wn4vxKfV+fXdzG8fyPrBamW+PvCH4sANTo/LxwSilNoBcjHJevAxeQ0kDFu9Io2sWxnIjiuGnXIS+0sQVrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750611462; c=relaxed/simple;
	bh=1zZuv+eB2qla/l9yYAzq0vGiZJhKLWAqb60fO58Zdrw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Sq7lFfBJaNUNwLNF8YoELYMZBLItP5uJ0/5Pivd2zmZJvNfC48KzQZe6nOKn2PQXqQgZEtkXjbzP1auOZ12EHrQ+8TgJA1I/gSZrN3ZkDlFVuFhBpwCLqdsUK+kzwwrnmwma5dlfIIIAbwqorj7jWzEsKPoGH4R7R718YFKrtDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=UGd/swRH; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="UGd/swRH"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-607c2b96b29so5869202a12.1
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1750611458; x=1751216258; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=kH6SnANQ47m1wSFT64o9y3OjbbEmJRBS7PRTptJ1lvQ=;
        b=UGd/swRHHEY7t85CVU4pc1uQAJzqTmXBm1XrVSWycA2Z74edZHxNFZ9u0EDJxVXwIT
         YzfuTSEnqMhwkSH+Suu0iq6jwn068rAf7FgCpYSt0WMjFIDBDCuv7xkREgW4eHBVDAUq
         tu72ZmSJZHOQXNorcSuz3u2eMa4QiKQb3L/yU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750611458; x=1751216258;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=kH6SnANQ47m1wSFT64o9y3OjbbEmJRBS7PRTptJ1lvQ=;
        b=FU9gedIcMGVJU+t4pvJUBa75Jm2+rd14CAsIZpvpI7Vvkbw+1kU190kwizzcDysZ05
         ro/Oh0kpLz2vqv23LVBdgRJN5LYr9+GHc+JStNn/dv4Qb7PnNJUJHGPUuXSs6BzqkJeD
         h5WaQrP6y5geKV/dm/7KLvQh+RmGZpt4YhSnbE9W5nmOVG0r2hYR+q3X+73iYxhFUEZ9
         5qoiFwNQbT+bnPOBLl/wmQk9DnBNDVIfa1LGtSKZZuSeVle7ZWJpdoM/o5Eoq/8zBlKa
         16rC7xHQZAwGubUcAOo68ZCgOYxi107N0J8r+WjhkF5mCrM28rQgPiBea/WaQKddOs0c
         HvZQ==
X-Forwarded-Encrypted: i=1; AJvYcCWhE3bSQam1pT8SUjmfaag/zgid88Ff5+3XSudZppdJxQlOKTi5mnZa0yaHQZTZmDPCYZO5x+FISG71IIQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkTyXg3S9BzbjGaw/SpakvcPv9Va2/lwfD9pPlAkG6JQtF8Y5g
	+gN7lYPLOG2Y26IuWgjavLkUJ6WBQ6g57R4FlqrKUsXn763hEu/hkr12THpwVrryOfdSzqhjMnS
	zfEP8
X-Gm-Gg: ASbGncvWbw07wftnVTH5lrnwtpClhiygQ/jdsKc241ih460j9v9C85nfaX+K39ZDvNf
	+KucDCrqDZRuk3v1Ezol1X0rn4D8BRKkFPU49BZ7s4XrtEbvildNbFGlrfA6xEyS6kWrRod25f9
	YLMtzssiZ7rCCc0HHHerDiAf5NEPuOB2KFe3Gb6OdfA2ghCjYskTiu6MPcs7aHc8f3Xz5KtZt6u
	BA6LyXeLA9yw1Tl9vaM7qqQVLYtuRNUxbANMTYSzcNGo6PEwWIpDCjjdfGg/2sFFNgn1M6DB/ki
	fdbXRF3sqReMdFcQ0SVOFbTiC7xNKHtsqB6+fygUVORZ+rsYdszv6xMeZcxmto1lx78PU3LKYVX
	aQ9dQtTCfj9aEw2rHYQ+okoJsLyXLFTwXhwbY
X-Google-Smtp-Source: AGHT+IG9/uqv1p+Z2f2kYs1fHuco52bdVwkStB0cF5AVN6utVvQ/6Kl0F37YNG22pcCI/ePy0/u51w==
X-Received: by 2002:a05:6402:35c5:b0:607:27bb:7bf with SMTP id 4fb4d7f45d1cf-60a1cf3413emr9264020a12.32.1750611458030;
        Sun, 22 Jun 2025 09:57:38 -0700 (PDT)
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com. [209.85.208.44])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60a18504e16sm4888227a12.6.2025.06.22.09.57.36
        for <linux-kernel@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 22 Jun 2025 09:57:36 -0700 (PDT)
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so6642813a12.3
        for <linux-kernel@vger.kernel.org>; Sun, 22 Jun 2025 09:57:36 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUmanUAXdif1pzIwYrq9VmEGTmR43eP/ILhP2ejfGgpfOSNX9BKnaVDyaAMj1FGDO4/O1ytXgDXi4Svf/s=@vger.kernel.org
X-Received: by 2002:a05:6402:1e90:b0:608:3571:6942 with SMTP id
 4fb4d7f45d1cf-60a1cca9d65mr7384121a12.1.1750611456313; Sun, 22 Jun 2025
 09:57:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1750585239.git.christophe.leroy@csgroup.eu> <f4b2a32853b5daba7aeac9e9b96ec1ab88981589.1750585239.git.christophe.leroy@csgroup.eu>
In-Reply-To: <f4b2a32853b5daba7aeac9e9b96ec1ab88981589.1750585239.git.christophe.leroy@csgroup.eu>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Sun, 22 Jun 2025 09:57:20 -0700
X-Gmail-Original-Message-ID: <CAHk-=wj4P6p1kBVW7aJbWAOGJZkB7fXFmwaXLieBRhjmvnWgvQ@mail.gmail.com>
X-Gm-Features: AX0GCFts7S7trAg95_9iRhGDGkpXCnUtzlq1LLaD_2GFvkl-rWcgRNFXTCHwODg
Message-ID: <CAHk-=wj4P6p1kBVW7aJbWAOGJZkB7fXFmwaXLieBRhjmvnWgvQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] uaccess: Add speculation barrier to copy_from_user_iter()
To: Christophe Leroy <christophe.leroy@csgroup.eu>
Cc: Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>, 
	Naveen N Rao <naveen@kernel.org>, Madhavan Srinivasan <maddy@linux.ibm.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Darren Hart <dvhart@infradead.org>, 
	Davidlohr Bueso <dave@stgolabs.net>, Andre Almeida <andrealmeid@igalia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, David Laight <david.laight.linux@gmail.com>, 
	Dave Hansen <dave.hansen@linux.intel.com>, linux-kernel@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, linux-fsdevel@vger.kernel.org, 
	linux-mm@kvack.org
Content-Type: text/plain; charset="UTF-8"

On Sun, 22 Jun 2025 at 02:52, Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> The results of "access_ok()" can be mis-speculated.

Hmm. This code is critical. I think it should be converted to use that
masked address thing if we have to add it here.

And at some point this access_ok() didn't even exist, because we check
the addresses at iter creation time. So this one might be a "belt and
suspenders" check, rather than something critical.

(Although I also suspect that when we added ITER_UBUF we might have
created cases where those user addresses aren't checked at iter
creation time any more).

             Linus
