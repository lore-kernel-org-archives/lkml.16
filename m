Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 380E22144CA
	for <linux-kernel@vger.kernel.org>; Tue,  4 Feb 2025 17:40:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738690817; cv=none; b=gYi9owkNl08EDks7Z951wNYwkQgxl3iLiuxiryE62yubExUrh8nCYEj2ElLrvz3g1EBfwASeoZfVbsffH6NBAKkutOw6yxKi7XotsKjCfWfqUvUZ8oFk2s+PLe1O3rrMk8taOgaWb/zXqquVGkPPMt4UQVoeSNE/BsD0uu/jnNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738690817; c=relaxed/simple;
	bh=QpHyE9p91zurcepTIwYUtQMiEe5sgWOkIP/OjYpEd2Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R7CVFGm7rBOtoTjpRngG68YbsFXym+4UUqgiMfAPhmvnDItTQ8nrqWXmLbZDF1V9bfxvWIUC8bPHuyGrulKNxVbJklJWvL4Z378TRwCdrHa3VHvbXm60R6n+BnWdtWqaPZULHmlDiXnQnp9wwiIH+A390BVgq4UFIcqWqglBSvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=kmfyWLrj; arc=none smtp.client-ip=209.85.210.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="kmfyWLrj"
Received: by mail-ot1-f48.google.com with SMTP id 46e09a7af769-71e1d7130a5so2710485a34.0
        for <linux-kernel@vger.kernel.org>; Tue, 04 Feb 2025 09:40:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1738690813; x=1739295613; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4yNpm3oxBxQoK8aYrbHM1Sjc+SJkp488Q51eRV/v/s8=;
        b=kmfyWLrjG0oSHQi3GWjSvdnebF5va/JG+gSM3PdTMRKkZPqxER/G5CGIE3GZQQ1DcE
         U58mqMF0iK+hXHXHIuK4WWY/BG9mEDlRoCDQe5yzMSdBcKboMWIusNbEoX2MskUVhvjj
         bOKnVwMwrZ9yFJQMYewirAUsUUVRmwIKbRhJqHPCw1puUpVkxsgwqa/zCpbwa2xlpn0W
         qK4FnvSj5gFJ37Qyr2uvlONWG1+70nbAlYylkpzWw+R5u7INvy4KxI7DEDSVBX5oS1ZB
         gzX+Qwq5Xs50xPmli9dHaHUlCgSBUT33h+ehot5FzgwIS1OGXJ9vLiULLcpZx2tCzUJ7
         UgZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738690813; x=1739295613;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4yNpm3oxBxQoK8aYrbHM1Sjc+SJkp488Q51eRV/v/s8=;
        b=Iw78ng5Lr0fFMlTEp8WLdbxlbFpo4Bhf1Ud7PNx+plkkKj+GGpqYdBmIqbGid5Y3HU
         GKdV5CpYaemfavzpSoGw/QhhN8jt1FNRCfXGGLcLGfela49LMa1AjvyluxhOFUdFYhQW
         Hi0BT900+dKg4RGeGM4itot9ujYWqmbWZvy/4EHfCtPGZVJFzlxtPTAinzEJIT8jvd07
         m6t9QMMMLa9hA9jUo3wX3pTcXoz1HQ4+Ke4tklhK6HzL0QwsbhAHcTwS3goJYN1LkL4T
         L4jkE8iQC5Xkc3ZQ3NlFABF54I3ulCZX/x1dSdpmnGlefK6ofsYDdDm1JC7MKYQCRmDW
         j3Tg==
X-Forwarded-Encrypted: i=1; AJvYcCX/M76QOXn3WGmCqweWFfybrmv5ZYdJbGh4/wioy5MwDMDyN40FB0w3wFFZ21SbUmMQGyAlUZtto1EwYQM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxktetuFMpHak1bSyNne3yahWkHjCEzSO1QZBKHY+Q8TP3qvYyb
	tYajCpVtnDgYk4hBoQYT3FS89O5L6C59dFfSC+w1kNUn9kZNkUeHh4xGoHyuXJM=
X-Gm-Gg: ASbGnctab8g5oTCNQHExhnG7yn8V6uhByWl6o1cmAm4CyT4+AQ1cjpAEn8+ewftOXJA
	CQeAcuiys/7iH2JpfF8SjSfAu03kK2RlKNegG1JjUM5muV2niuSVWcdPh8h9XjeGJ9ylR4Ntsc5
	fum74dkdvjzwi5FaWYQyMgnA2guJCGWW0dr3hyuUn9FbtrPKVeTy9L3QzBEsKLc0afwRQiT0bZb
	7ozpgn3FLPhDYy85whPR930z7o/WNZPLs2kqRKFody5QqovNBSQYFAE8LKlVzYaAj2hKsonS7Mr
	qDINsYIupYD0S8x+eu1rAjiRROxMar+tuPbTFZcHiC91gYOmbpZw
X-Google-Smtp-Source: AGHT+IHMhe2zw6EhaL7q6kTxgWmbctXCIhVeGH/cEyX92tLO3USqYme0owv4+lKlSehxaf+Qho0gDg==
X-Received: by 2002:a05:6830:dca:b0:71d:f8bd:4be4 with SMTP id 46e09a7af769-726568db701mr16382704a34.19.1738690813188;
        Tue, 04 Feb 2025 09:40:13 -0800 (PST)
Received: from [192.168.0.142] (ip98-183-112-25.ok.ok.cox.net. [98.183.112.25])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-726617eb165sm3408870a34.38.2025.02.04.09.40.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Feb 2025 09:40:12 -0800 (PST)
Message-ID: <e4befaab-9622-40d3-bd4c-e12111df45e7@baylibre.com>
Date: Tue, 4 Feb 2025 11:40:11 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH-resent-to-correct-ml 0/8] drm/xe: Convert xe_force_wake
 calls to guard helpers.
To: Maarten Lankhorst <dev@lankhorst.se>, intel-xe@lists.freedesktop.org
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Will Deacon <will@kernel.org>, Waiman Long <longman@redhat.com>,
 Boqun Feng <boqun.feng@gmail.com>
References: <20250204132238.162608-1-dev@lankhorst.se>
From: David Lechner <dlechner@baylibre.com>
Content-Language: en-US
In-Reply-To: <20250204132238.162608-1-dev@lankhorst.se>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2/4/25 7:22 AM, Maarten Lankhorst wrote:
> Ignore my previous series please, it should have been sent to intel-xe, was sent to intel-gfx.
> 
> Instead of all this repetition of
> 
> {
> 	unsigned fw_ref;
> 
> 	fw_ref = xe_force_wake_get(fw, domain);
> 	if (!xe_force_wake_ref_has_domain(..))
> 		return -ETIMEDOUT;
> 
> 	...
> 
> out:
> 	xe_force_wake_put(fw_ref);
> 	return ret;
> }
> 
> I thought I would look at how to replace it with the guard helpers.
> It is easy, but it required some minor fixes to make DEFINE_LOCK_GUARD_1
> work with extra init arguments.
> 
> So I changed the function signature slightly to make the first optional argument
> a struct member (current behavior), and any additional argument goes to the init
> call.
> 
> This replaces the previous code with
> {
> 	scoped_cond_guard(xe_force_wake_get, return -ETIMEDOUT, fw, domain) {
> 		....
> 
> 		return ret;
> 	}
> }
> 
> I' ve thought also of playing with this:
> {
> 	CLASS(xe_force_wake_get, fw_ref)(fw, domain);
> 	if (!fw_ref.lock))
> 		return -ETIMEDOUT;
> 
> 	...
> 	return ret;
> }
> 
> I'm just fearing that the scoped_cond_guard makes it imposssible to get this
> wrong, while in the second example it's not clear that it can fail, and that
> you have to check.
> 
> Let me know what you think!
> Feedback welcome for the header change as well, should probably go into the locking tree..
> 
When I tried to make a similar improvement, Linus said to please stop trying
with the conditional guard stuff [1]. So my advice is don't do it.

Just replace the:

> 	...
> 
> out:

with a helper function if you want to get rid of the gotos.

That is what we are doing in the iio subsystem [2][3].

[1]: https://lore.kernel.org/all/CAHk-=whn07tnDosPfn+UcAtWHBcLg=KqA16SHVv0GV4t8P1fHw@mail.gmail.com/
[2]: https://lore.kernel.org/all/20250105172613.1204781-1-jic23@kernel.org/
[3]: https://lore.kernel.org/all/20250202210045.1a9e85d7@jic23-huawei/
