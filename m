Received: from out-183.mta0.migadu.com (out-183.mta0.migadu.com [91.218.175.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B92C11F2377
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 23:33:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743636793; cv=none; b=FsYEHVaIhbmhdOqFKinwEFrNecakuWsbr6bwS6gIcaDmN7Td1UJWbtzhmyO8LegqFG8bPgr6Nnpl9oy3kA8gOi4csRA4VAeY1ciMHclGWq5CV1csAWptK15bw9yu/jDon5D/TCC/lwMY2S1QdMQVSEMOnnLti/XWEANbANukmyU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743636793; c=relaxed/simple;
	bh=+9f0xh9bpu/7FQEc1yyrZuyMy6JfBPpuLuPzy6kUEmc=;
	h=MIME-Version:Date:Content-Type:From:Message-ID:Subject:To:Cc:
	 In-Reply-To:References; b=sUbB0I5EuQYYPqHSQ5BvRziD0d9q0dskFqy6N0qPN00cHyjDnUeTt6NbC88LhyHHr7FLw9y8vnm3qi6vke1cGU45ZiWuZ6J9Aex2NcVKOGXJ7GSIOWfw6c3AJSwUTreIJpvZV2mvcfvRdneKn6MZN03lK1pcmQnPwEIQYg+x/3s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=mllKh4UH; arc=none smtp.client-ip=91.218.175.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="mllKh4UH"
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1743636779;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UESCMlxPt4+JIRa3Qu1C2NXufnZRpQhrOYXEHP5fpf8=;
	b=mllKh4UHS4YIajtS+ukvBMhZJk0tBnJgnUp+VMdaSPVYdpUtWv5JDPEA5ziLb8bcBXxIvV
	qT6xmonW6v3+uum6xqQ3VHSj109JVM2/VdiWZl/SCRm1msbiT5duLFFYVGPpSG1jTb+q8u
	ZiBMymUj8uMTI4xqxmLpCWqtGwVPpkw=
Date: Wed, 02 Apr 2025 23:32:58 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Ihor Solodrai" <ihor.solodrai@linux.dev>
Message-ID: <ef200416879d61e6e492de7e7c1cae315f63151f@linux.dev>
TLS-Required: No
Subject: Re: [PATCH] scripts/sorttable: Fix endianness handling in build-time
 mcount sort
To: "Steven Rostedt" <rostedt@goodmis.org>
Cc: "Vasily Gorbik" <gor@linux.ibm.com>, "Masami Hiramatsu"
 <mhiramat@kernel.org>, "Catalin Marinas" <catalin.marinas@arm.com>,
 "Nathan  Chancellor" <nathan@kernel.org>, "Ilya Leoshkevich"
 <iii@linux.ibm.com>, "Heiko Carstens" <hca@linux.ibm.com>, "Alexander
 Gordeev" <agordeev@linux.ibm.com>, linux-kernel@vger.kernel.org,
 bpf@vger.kernel.org
In-Reply-To: <20250402192851.0bc6fc77@gandalf.local.home>
References: <patch.git-dca31444b0f1.your-ad-here.call-01743554658-ext-8692@work.hours>
 <6acbc2347a86153c2646a4bfebaa226e9b0e01f7@linux.dev>
 <20250402192851.0bc6fc77@gandalf.local.home>
X-Migadu-Flow: FLOW_OUT

On 4/2/25 4:28 PM, Steven Rostedt wrote:
> On Wed, 02 Apr 2025 23:22:40 +0000
> "Ihor Solodrai" <ihor.solodrai@linux.dev> wrote:
>
>> Hi Vasily,
>>
>> I can confirm that this patch fixes BPF selftests on s390x:
>> https://github.com/kernel-patches/vmtest/actions/runs/14231181710
>>
>> Tested-by: Ihor Solodrai <ihor.solodrai@linux.dev>
>
> Thanks, but I already submitted a pull request that includes this fix, =
as
> it looked pretty obvious (I did run it through all my normal tests, but
> just didn't test the big/little endian case).
>
>   https://lore.kernel.org/all/20250402174449.08caae28@gandalf.local.hom=
e/

Sure, that's fine. I had to test it anyway, so that a revert
fa1518875286 patch could be removed from CI. Just sharing a data
point.

Thank you.

>
> -- Steve
