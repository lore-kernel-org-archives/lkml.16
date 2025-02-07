Received: from out-171.mta0.migadu.com (out-171.mta0.migadu.com [91.218.175.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76BFA19C540;
	Fri,  7 Feb 2025 17:31:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738949484; cv=none; b=pJ9p1QRUtth8ay/I9o4LEiIwef8KgE7S2QBJug2SK7ySZH+CcsHE1JluZdKWLssMKeKpUUCiHs1CJRENIce6FjqByF5PyTCV3p2u6o3seTQrCC2GHlGQEty3nM++gAKwliTEC4K5PM7Ka0lH8JX5kI0HXIGgHGv98ywcuA/eOco=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738949484; c=relaxed/simple;
	bh=DMoehDVrexS+KO0jDz168m0nPSMZhAKy9NA3o9zTPqw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=dedCHwVzvy1PcMyRWcASyjKxfKjE2U82EAZkIntvgqsmzJDdJhD8i+cpR4iyHm1E7JWKQicWYW/aF4VR7YxEBL2uYTVsMzaPLfsJ24zBkYLggSlKPsf0Af4eO/PZL8gng0HJih/C6JdLFoKk6bDjvw1dMX+2QYqWwlkB2U9kpzE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=Vqp8+wTl; arc=none smtp.client-ip=91.218.175.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="Vqp8+wTl"
Message-ID: <a7b185bc-ff77-4701-a4dd-b93d5613643a@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1738949480;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9g4ND8PPP28x50vbU7Fogg2mjWlyGpBFIHQIKFRKzBE=;
	b=Vqp8+wTlTVL6bE0bo52wGbA8p9PswYl0fctqjGXZ4u02noCxob1wbd/rlpymbUAE+ISL3l
	nJPnxRV55knkF4BZi/5OH+fbBPhF2dLH5XnyPu2uZMAvAqQpUXpwRsDAKXEjYbtkV4Y04Q
	Dcb9kLXImFzgFZ8NhgCEiOJhx8qzZP4=
Date: Fri, 7 Feb 2025 11:28:12 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v9 0/5] Support system sleep with offloaded usb transfers
To: Guan-Yu Lin <guanyulin@google.com>
Cc: gregkh@linuxfoundation.org, Thinh.Nguyen@synopsys.com,
 mathias.nyman@intel.com, stern@rowland.harvard.edu, perex@perex.cz,
 tiwai@suse.com, sumit.garg@linaro.org, kekrby@gmail.com, oneukum@suse.com,
 ricardo@marliere.net, lijiayi@kylinos.cn, quic_jjohnson@quicinc.com,
 linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-sound@vger.kernel.org
References: <20250117145145.3093352-1-guanyulin@google.com>
 <943a7b09-8e77-4813-810a-18fea0e61482@linux.dev>
 <CAOuDEK3aip9SLCUPOzpVPwx-O4rmF-+sQrF4GJasGPBzV=qJdg@mail.gmail.com>
 <e5b1c3bf-4457-4859-92fc-785f7d6037fa@linux.dev>
 <CAOuDEK2u509kNjyL6qm27QgvtoCscRcsLixW=W8ABz2NF8A-tw@mail.gmail.com>
 <c8c699f7-bf9b-4e36-910e-c6f1c7092543@linux.dev>
 <CAOuDEK1w9Xbik-VbXwSd1ZYUWx9EQ_TnvEdV3WX2L-8Wtuj5bw@mail.gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>
In-Reply-To: <CAOuDEK1w9Xbik-VbXwSd1ZYUWx9EQ_TnvEdV3WX2L-8Wtuj5bw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On 2/7/25 04:54, Guan-Yu Lin wrote:
> On Tue, Feb 4, 2025 at 7:57 AM Pierre-Louis Bossart
> <pierre-louis.bossart@linux.dev> wrote:
>>
>> On 2/2/25 20:57, Guan-Yu Lin wrote:
>>> On Tue, Jan 28, 2025 at 11:22 PM Pierre-Louis Bossart
>>> <pierre-louis.bossart@linux.dev> wrote:
>>>>
>>>> I am not following, sorry.
>>>>
>>>> Is the desired outcome to
>>>>
>>>> a) prevent the system from entering S3 if there is an active USB audio offloaded stream?
>>>>
>>>> or b) allow offloaded transactions even when the system is in S3?
>>>>
>>>>
>>>> which is it?
>>>>
>>>> a) would be rather interesting, but currently we don't have any such behavior supported. When the system enters S3 all audio stops. The stream will resume when the system goes back to S0. Do we really want the battery to drain in S3?
>>>>
>>>> b) seems rather complicated, once the on-going DMA transfers complete then who's going to refill buffers for the USB offloaded streams? Allowing the lowest level to operate even in S3 is only a small part of the puzzle, someone's got to provide data at some point. Unless the data is generated also by a side DSP having access to mass storage or wireless interfaces?
>>>
>>> Thanks for the question, the intent of our proposal should be (b), to
>>> allow offloaded transactions even when the system is in S3.
>>> In our design, the DSP wakes the system before the buffers are fully
>>> drained. This patchset enables the USB controller for offloaded
>>> transfers during system suspend (S3). To be precise, this patchset
>>> focuses solely on enabling the USB controller in S3 and does not
>>> include other necessary components for continuous offloaded USB
>>> transfers. I'll revise the commit message/cover letter to reflect
>>> this.Thanks for highlighting the potential ambiguity.
>>
>> Thanks for the precision.
>>
>> It was my understanding that anything above S1 could incur a hardware/software latency of two seconds or more to go back to S0. That would imply a buffering scheme that's significantly larger than usual offloaded solutions. In "typical" offload implementations it's rare to go beyond 100s of ms, since at some point you run into user-experience issues when applying volume changes or when changing tracks. It's usually a no-go if the user has to wait for a perceivable amount of time while the buffers drain.
>>
>> Not to mention that quite a few platforms no longer support S3, since 'Modern Standby' aka "S0 Low Power Idle" or 's2idle' was introduced in the Windows 10 days S3 became largely a legacy feature gradually dropped since no one really uses it.
> 
> I think for mobile devices, the S3 state is still used since the
> hardware/software latency wouldn't be as big as you described, so
> mobile devices could still use S3 for power saving. How about using a
> "knob" to isolate the feature to specific devices? "Knob" could be
> dynamically switched by some functions, or we could statically
> determine it as a dts attribute or build config. Will a "knob" address
> your concern for this feature? Do you have a preference on the "knob"
> design?

My recollection of mobile devices is that they only relied on S0 platform substates, e.g. S0i1, S0i2, so that the device was always 'active' from a pm_runtime perspective. I have never seen a case where the device was 'active' in S3, I don't think this can work with the current system/pm_runtime power management, can it?
In other words, audio streaming was supported in S0/D0, S0ix/D0ix but S3/D0ix was not a supported configuration.

That said, if you managed to make this work, at the very least this should be a device-specific property, not an unconditional blanket enablement of a capability that raises quite a few questions.

