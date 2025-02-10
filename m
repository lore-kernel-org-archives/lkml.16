Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DDD1CD208
	for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 11:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739186579; cv=none; b=mvobOUT1i2DEwocIAO4cNI8O3YqiYeZ5pr9zBhWpdF1PhmrP57Np6CWTMWPx4ub57o8QIGV58ABnPY7OO+m3StUbCeRzbk2oEZcBisjHwZXn1ppFKyNqVJ0TC81+Sfejf+klrRYd+B9SyVqcNOKMZ3suLUqox+dEw8Ve7TuwCX4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739186579; c=relaxed/simple;
	bh=G52iyUCkmPX0OY5YfqE5KfMGVk5WbJ1yp1DfcVWbI1Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ROmL3HZ/exYJom/AYQbUjxQydkDx/ez+mncgL3/j19dGty2RfwdGyxJf08CElHpzzbBAwoz4k5bQmE7djvzaNTR1r8FIotMS2sNHmd95SAqxxpBG6PHxPek6Cx0I2jmymKf0UxOru6x8azialHKkSrGzrhBBmM3RdWxULZeSJW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T4W2ehsp; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T4W2ehsp"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4718aea0718so253841cf.0
        for <linux-kernel@vger.kernel.org>; Mon, 10 Feb 2025 03:22:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739186576; x=1739791376; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=G52iyUCkmPX0OY5YfqE5KfMGVk5WbJ1yp1DfcVWbI1Y=;
        b=T4W2ehspPHXN9IlmaU1zwsoL2GNjnj3a4J5Q+UjMqvEMk5IGBNjPqfaPmxpB9ZeDzb
         Wx/LhJJyuys+AOCDA0vkWhRjtRLRCLrzspd1n3weDp7t5OQSXZA+q04LbebpCQnDcERF
         f0SLC6dRObmlqV0QEaQh4EtmYHG/Z6IPtCMhU/pydkA1sq2xJ789rt4IkPO1F7QOGIBP
         +JftcTDrWjnPV8ujNuQhAxlMStqNnKgTtuC7vv6KBLrsnnFTELkvzWJQxgk3oA/F0Z9u
         RJHpRhB8+fmMmI7VJoIQ0WLdRY/jIxiuXENkiwwGCJf6e68AkBXx1Awy//z/5eLrB1Bd
         XFVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739186576; x=1739791376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=G52iyUCkmPX0OY5YfqE5KfMGVk5WbJ1yp1DfcVWbI1Y=;
        b=AiVgw6iYeCqLEMZjDodzBJB8O3jEfBvs4ZAn3ZPpuqO4sQtevWFC+wMdCRcca2ESQk
         vJ5nFdTQEMnGZ63vS8N1QD6l2PE3yH7FwNLRNQweVmhqsdNr4npEi954B4NLQe3U6600
         /ob8CLnMW63CklJUWbKU5Q0B7eV7ytoKwNG8KZEcqGQLvf+8AFR3rCKC2I2wRGc0gfTa
         AzjLEMfuR3eLP8y5PY3rwHCRDdntriu6MujEAVIOyMzsJSkRNQzPmgVQUTTI/V31tTzI
         nfgsdv6wU8HPXGsz28c7GgApDSqMEf2FNFoTRFvQKomQ4WjtV04tUYoZvK3Bh6ekwTHX
         eg4Q==
X-Forwarded-Encrypted: i=1; AJvYcCVr8EZTqUjU21KXRRyCoUr4jVx+I+dGTIbhn644APJjeA9mDaTvP2tVKF4bP7GivNSNBc0emyi4nMG0BNE=@vger.kernel.org
X-Gm-Message-State: AOJu0YydTUGFnQVOSX4Q0rnVGrnxu9MCdFlyGuYn3ChRywm8QWVCBuKG
	so30qHoVTu5XZbe6ZmFVQy2+Xpyy6D3+tQsIX+mwGyrk9sbJpfjfYtP0MgelJr/L703oBmoEt++
	doQ5onwqT225YTXs4Lv+HXXV8Wf6oLWU1UQea
X-Gm-Gg: ASbGncsoC9iDkeDiWfWy7T5WbmWq83OS5Ae12Jkm7ry9+Cu77/wlH8pzJ8xIqgIUq6o
	W3Jsc3gqiyFIU1uMgzcWd572DJxAj446Qr9h/UJG6zfMaI+UwmfXdXiDS1NKTqPh77I978A/drD
	CzmIFwvttyyFwNzNu+MVGnyoh6YHA=
X-Google-Smtp-Source: AGHT+IGWIAJthDtwMQZ0gqKG7+CsLapbpyAi5mCvCQQqlukiOFctO943B34380/mAaJdgNWF1tQiIbKbwmznCJfBSVA=
X-Received: by 2002:a05:622a:5c12:b0:46e:1ded:e31f with SMTP id
 d75a77b69052e-471759fcbbdmr5507451cf.4.1739186576139; Mon, 10 Feb 2025
 03:22:56 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206044346.3810242-1-riel@surriel.com> <20250206044346.3810242-7-riel@surriel.com>
 <CA+i-1C3LDJTf26WdBo7MvCdTs-dybqsUp3Ze7NowcOUHPWMXrg@mail.gmail.com> <84be5ed882141c8b407a78590f6ecbc7080c98b0.camel@surriel.com>
In-Reply-To: <84be5ed882141c8b407a78590f6ecbc7080c98b0.camel@surriel.com>
From: Brendan Jackman <jackmanb@google.com>
Date: Mon, 10 Feb 2025 12:22:45 +0100
X-Gm-Features: AWEUYZlZKITTQi7m9mmN5ZyB75aVg0AxeLDBiB_aquYnmDsgFsE-Cf9HIreRXA4
Message-ID: <CA+i-1C1rYcf-qU+chzeAdFHZKrtSVvVPenQVipjSAEnbQPyJrQ@mail.gmail.com>
Subject: Re: [PATCH v9 06/12] x86/mm: use INVLPGB for kernel TLB flushes
To: Rik van Riel <riel@surriel.com>
Cc: x86@kernel.org, linux-kernel@vger.kernel.org, bp@alien8.de, 
	peterz@infradead.org, dave.hansen@linux.intel.com, zhengqi.arch@bytedance.com, 
	nadav.amit@gmail.com, thomas.lendacky@amd.com, kernel-team@meta.com, 
	linux-mm@kvack.org, akpm@linux-foundation.org, jannh@google.com, 
	mhklinux@outlook.com, andrew.cooper3@citrix.com, 
	Manali Shukla <Manali.Shukla@amd.com>
Content-Type: text/plain; charset="UTF-8"

On Fri, 7 Feb 2025 at 21:51, Rik van Riel <riel@surriel.com> wrote:
>
> On Fri, 2025-02-07 at 17:03 +0100, Brendan Jackman wrote:
> > O
> > With !CPU_SUP_AMD and the above, broadcast_kernel_range_flush
> > disappears from tlb.o. (Caveat - I didn't actually read the disasm I
> > just made it noinline and checked the call disappeared).
> >
> > It's actually more lines of code but now they're off in a boilerplate
> > header and it's consistent with the other flags that do this.
> >
> What compiler did you use?
>
> While I like the cleanup in principle, I
> don't want to saddle people with older
> compilers with extra code they don't need.

I used a pretty fresh Clang but I'd be very surprised if it needs a
fancy compiler. Compared to

if (IS_ENABLED(CONFIG_FOO))

I think all we have with the disabled-features.h magic is

- An extra __builtin_constant_p - I did a quick search and I can find
GCC release notes referring to this at least back to 4.7 (2012) [0].
Note also this doesn't create any code.

- An extra bit of constant folding to turn the (x & y) into
true/false. This seems like something compilers have been good at for
a long time. And if someone's happy with a compiler so old that it
can't do this, I dunno but they probably don't mind a few extra
instructions.

[1] https://gcc.gnu.org/gcc-4.7/changes.html
