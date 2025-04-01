Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D7D5DF60
	for <linux-kernel@vger.kernel.org>; Tue,  1 Apr 2025 02:15:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743473728; cv=none; b=bcuBHIUFCJ3p0MwOP+/6qZoxc1/2TiarA+7plcMkYK+NweHIcN940peTswwP0MtPwyaS34PiPbfUl3T5Dqy82NHJ0RG8Ob8jOmBv/pEoegDowks+bRfuqZ8yrtddKluf4V66n3iTFNZ9LwNlnwakwHCcouCee0fLmidsQ6lBRQA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743473728; c=relaxed/simple;
	bh=Fqvw6uxuRFvcoeqKohK6RGL/Kz3larBJDRQ1jIJPPXM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nkKVGmrtq7nJ144Ek1P8bf2ZU3rezsmMagiM0/R+mP29yza7aYZj/Jlu66RipEQMpAqnBD/HqU82kUsfF93yv1c4R3npDtgJ6WhHwDkpAHZhDffTz/5NyqUxODRtKLpWlErPsSK8Vr48vyu0nQMriADWP36sW4QPbyAR6P2plL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=mSnWgYCS; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="mSnWgYCS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1743473724;
	bh=Fqvw6uxuRFvcoeqKohK6RGL/Kz3larBJDRQ1jIJPPXM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mSnWgYCSDUpsSYxqJzqP1YbE1hOkgqQANXSLFZZv2u0prxrNG+HUhtXFOoM76l7vN
	 NgJYYva7aWM9t9rOIT9A9tiKpnUzEHAj4TEF3jgEjKGn+di042b+/RR9SJvCrZwOm1
	 xZguuoikmEzHe9ZFYinY9hXLq8IS9W6Orn9+RT4vQN82XIHAPCzP5gkMv92zkxB92H
	 n/hcZ8nNpVDU0rrjhStbvihGmEaARONN/QUYhcCpRmIgk2Om2rHWyJ6hA1dHJzPKIT
	 +JCo3wygXLpSpE3El6BhBbhsgOGcYeLp16KX+AglKj8kr5JTgA9XS5J7Y+uLzW5ZnT
	 MDqzZ3hRWLc1A==
Received: from [192.168.50.250] (unknown [171.76.83.191])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: vignesh)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7CEE517E0CD1;
	Tue,  1 Apr 2025 04:15:20 +0200 (CEST)
Message-ID: <ddd0095e-72b4-4cd1-9216-2071afbbad25@collabora.com>
Date: Tue, 1 Apr 2025 07:45:09 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/3] drm/ci: Add jobs to validate devicetrees
To: Dmitry Baryshkov <dbaryshkov@gmail.com>,
 Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 dri-devel@lists.freedesktop.org, daniels@collabora.com,
 helen.fornazier@gmail.com, airlied@gmail.com, simona.vetter@ffwll.ch,
 robdclark@gmail.com, guilherme.gallo@collabora.com,
 sergi.blanch.torne@collabora.com, valentine.burley@collabora.com,
 lumag@kernel.org, quic_abhinavk@quicinc.com,
 maarten.lankhorst@linux.intel.com, tzimmermann@suse.de,
 linux-kernel@vger.kernel.org
References: <20250327160117.945165-1-vignesh.raman@collabora.com>
 <20250327160117.945165-3-vignesh.raman@collabora.com>
 <v4dhuuuvfk63bakncz43z3ndjdze5ac7nrv6qvtpdnonfpetsx@5hh3vzcj336x>
 <20250331-amphibian-hopping-bobcat-e19a0b@houat>
 <CALT56yO-=nQnTB=H4L-qnta4js3FB=-WCOFj8q57PPWjLY+JKA@mail.gmail.com>
Content-Language: en-US
From: Vignesh Raman <vignesh.raman@collabora.com>
In-Reply-To: <CALT56yO-=nQnTB=H4L-qnta4js3FB=-WCOFj8q57PPWjLY+JKA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Dmitry,

On 31/03/25 13:25, Dmitry Baryshkov wrote:
> On Mon, 31 Mar 2025 at 10:53, Maxime Ripard <mripard@kernel.org> wrote:
>>
>> On Sun, Mar 30, 2025 at 08:06:45PM +0300, Dmitry Baryshkov wrote:
>>> On Thu, Mar 27, 2025 at 09:31:11PM +0530, Vignesh Raman wrote:
>>>> Add jobs to run dt_binding_check and dtbs_check. If warnings are seen,
>>>> exit with a non-zero error code while configuring them as warning in
>>>> the GitLab CI pipeline.
>>>
>>> Can it really succeed or is it going to be an always-failing job? The
>>> dt_binding_check generally succeed, dtbs_check generates tons of
>>> warnings. We are trying to make progress there, but it's still very far
>>> from being achevable.
>>
>> It depends on the platforms I guess. Some are 100% covered and any
>> warning should be treated as a failure, and some have not started the
>> effort.
>>
>> I guess we could solve it with some kind of expectation list, but I do
>> wonder if it's something *we* should be focusing on :)
> 
> I think that we might want to limit this to `make dt_bindings_check
> DT_SCHEMA_FILES=display`, checking all GPU / display schema files.
> 

Yes, will test the changes and send v2.

Regards,
Vignesh
