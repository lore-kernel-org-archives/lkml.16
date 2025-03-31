Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C676C1D54C2
	for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 09:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743411730; cv=none; b=cj9305OEJ7k/rzYmNji99ottBMnLl/+8FRgX+dFzs10Q2n4iO1tRFlXaNXKSb+eUUnfy6qnVyZtqpDbXmz4tpUiMT3H3eoeLlJmD5J2kA4eNZoLMoVeQeFhoWHNw5k1ke5Uiqzm2bHh7uevYP/F9zq7fTW2vT06Jr3eQ4Zx3vr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743411730; c=relaxed/simple;
	bh=qvvFTpXJsH/dizXxJH1cNBgUs9rfCdEXztDCZCwFJ2M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TLyfU86XEo6VLi8/6YaF6aK2CbMA+RNDdBE5XbRhZeqLT7kHS7AG0LsbqbQXSh8vZyxhS8yQCFEmIvb5S+VYLkl4KHPbCgGADeq4AAarsY8AXPRKhTQhLXHNhoN7Jxhr/461ZkG11CkyN4gP1ghD+qTN1hV9uZi7+7ymowzugKQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GIP+775y; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GIP+775y"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-aaecf50578eso739151966b.2
        for <linux-kernel@vger.kernel.org>; Mon, 31 Mar 2025 02:02:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743411727; x=1744016527; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=m2c1NUxCq5gdQHsucjf1lVgnGr3eF5CIZIN/8r9OpLA=;
        b=GIP+775yF3WqChIpTrcW4VsLRIAtegYFEl5nDW9u+39x+5LUBTQ+P1AvL80+FdD2KZ
         YTaDm0TE39gO03Pj2PI4Fa4/hL1MH1Eo4chJWWCZJWLH5R85ymGiDDJcly5KerCybuw0
         8P5TUoj1bg3R8drnCQQ+eUxuk7XaubHn7iOMfs2esDkSLr5fsoAEZChxqAzhlEFgJiL+
         L9UG62z8zLQnVEc9dyRFvEH+57kPL+7EN4N6eqluxOOGWJMC1HnvPNqCiBOObSF9PbFf
         mQDkeB6FvWg+WVNoXX75DyIcCNRQ9nftJCSI1oKT/CLOt8CUcuIjljhkrJ8Uv5VYQL+7
         yOZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743411727; x=1744016527;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=m2c1NUxCq5gdQHsucjf1lVgnGr3eF5CIZIN/8r9OpLA=;
        b=Xf7wiOKui432Wcm9UD8JAhJ++rK9zRsODQxRg5E8lG7ye3a9iAUCff1nuXbJSSGlc2
         T9CZCQ3hqA6J3zCAS3h5BGrihJXfXt7ptzO88McP2PxB89SAKmjjEElnuVGlisB8IKXK
         Kb9HpCno+4H1c4QvUavMy/HirT3WYaw6lQRg0HJI7sTG5IuCE9DB+XZ0gQyrrR9S66MP
         eLWvG3qQLcqN9dnmdQ0A1/BFaOMXbHi6IIKWaHxoW3F6RHh65vijvUDH+nHBVi7RTfyI
         n5odyVsCZNJuIRRbjs6tj/RjJtxYqdVeRpwHq6TUxD3gOhWYPX0L73CEVUHBIjWUqsCM
         Jx9A==
X-Forwarded-Encrypted: i=1; AJvYcCWLPKsZYDvDLaoQLBBQ4xqoOC8/pQZD1aWvTlLk54GVWxwteOFINuHDr1td5dAfKUNTE8f7S2a/0W1SziI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+ZMNCFTDc32T4hhWQdVPHaoD+A3+e4iuc9nCcD9wpSgmTN3aO
	0924CRgd8WWV3WKFtY76k12kctUSFkUg/v3Te8VoWnw5sAKSJHPA
X-Gm-Gg: ASbGnct3lSgxMHpcaifaGOUM2T4puXksiV4JAMPFxOZsIdbG0nh5Z97dTww1nxAhaXx
	9/nlINw33vDmyL0C6JzHNsPgT39gcMO0uj5gRfNuo56N0+wmfFF3IXjylSY8Unps5dq/Rn1hEBr
	ymqRaXLrtpVcbOe4aYkmLllbCIo4PRIO5+X2vsT3qK1bKVfxJCADhm/6CJNpvKy7MY3S1qIJzg2
	bGC9H9J3CDqZDtSe3ORO0QzfwkExrqecbNhe6HAFtoCSs77k1HMu/NuvRuJj3ZHJPuwzpQI1STA
	hHcilfjGwkUS1Yz5tJ9W3bhFLVSPVrm7ONJWSJMtIATABQPMRiUb110=
X-Google-Smtp-Source: AGHT+IGCmL7S/QJ80ep20XtvwvlqhTB6L5fXBPl5T+M0z9S76+6htgfi+JLUln/8j83j05D4LdEBOw==
X-Received: by 2002:a17:907:9693:b0:ac3:3cfc:a59c with SMTP id a640c23a62f3a-ac73898d4c5mr763751166b.11.1743411726640;
        Mon, 31 Mar 2025 02:02:06 -0700 (PDT)
Received: from ?IPV6:2620:10d:c096:325::dc? ([2620:10d:c092:600::1:345])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ac71927af39sm589868066b.44.2025.03.31.02.02.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Mar 2025 02:02:05 -0700 (PDT)
Message-ID: <8380f7f3-fd9f-45a0-b66b-85ec0b5d0144@gmail.com>
Date: Mon, 31 Mar 2025 10:02:51 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCHSET v6 0/4] Split iowait into two states
To: Jens Axboe <axboe@kernel.dk>, linux-kernel@vger.kernel.org
Cc: peterz@infradead.org, tglx@linutronix.de,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Christian Loehle <christian.loehle@arm.com>
References: <20240819154259.215504-1-axboe@kernel.dk>
Content-Language: en-US
From: Pavel Begunkov <asml.silence@gmail.com>
In-Reply-To: <20240819154259.215504-1-axboe@kernel.dk>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/19/24 16:39, Jens Axboe wrote:
> Hi,
> 
> This is v6 of the patchset where the current in_iowait state is split
> into two parts:
> 
> 1) The "task is sleeping waiting on IO", and would like cpufreq goodness
>     in terms of sleep and wakeup latencies.
> 2) The above, and also accounted as such in the iowait stats.
> 
> The current ->in_iowait covers both, this series splits it into two types
> of state so that each can be controlled seperately.
> 
> Patches 1..3 are prep patches, changing the type of
> task_struct->nr_iowait and adding helpers to manipulate the iowait counts.
> 
> Patch 4 does the actual splitting.
> 
> This has been sitting for a while, would be nice to get this queued up
> for 6.12. Comments welcome!

Good day,

Did anything good happened with these patches or related work?
Christian?

Reminder: the goal is to let io_uring to keep using iowait boosting
but avoid reporting it in the iowait stats, because the jump in the
stat spooks users. I know at least several users carrying out of tree
patches to work it around. And, apparently, disabling the boosting
causes perf regressions.

I'm reading through the thread, but unless I missed something, it looks
like the patchset is actually aligned with future plans on iowait
mentioned in the thread, in a sense that it reduces the exposure to
the user space, and, when it's time, a better approach will be able
replaces it with no visible effect to the user.

On the other hand, there seems to be a work around io_uring patch
queued for, which I quite dislike from io_uring perspective but also
because it exposes even more of iowait to the user.
I can understand why it's there, it has been over a year since v1,
but maybe we can figure something out before it's released? Would
it be fine to have something similar to this series? Any other
ideas?

-- 
Pavel Begunkov

