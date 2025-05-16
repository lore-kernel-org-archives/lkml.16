Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 525DA249EB
	for <linux-kernel@vger.kernel.org>; Fri, 16 May 2025 14:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747404608; cv=none; b=X+m0FQurus2lj+w5g+nfMMO9GshuZ7M8Bk1FFkRpuOgWCdcFiy+aPJzddStpSdrvZS8aDEEqlAejqVDEkP4iJg3XKW6EwS3kJ6n2/7DOv7rossVT5iA6E7XmVGeWPsZnGI5HY4FPwODUqAS+A2syU8/V65i/9OLOTHjwB1niGY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747404608; c=relaxed/simple;
	bh=79FImyXrY5yy4OZ2rwi96+XD2BI2u0/CBcrb4kwf83E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=knx5u+NF974XdYiTNjk4eNstKsXbp+J7kmjJwTh7Aii3bJTXNTasIN08C379wHv9PDBp4q6ZcRE2Ay8Ld0oi4sdFK67lj0pbdkbUJYfgW4+zH1mmM5i4y1XdQksni2nzpWAYhgy3WwjMLIgXNvqKdVpUrT16Itte/j/BpXmlX9M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rXhzIQNW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rXhzIQNW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 42719C4CEE4;
	Fri, 16 May 2025 14:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747404607;
	bh=79FImyXrY5yy4OZ2rwi96+XD2BI2u0/CBcrb4kwf83E=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rXhzIQNWuX50JNKeVbAxY0ZzkEwk4y52N1KjzcP804KFk6npac13sBu6fcFTOzwfB
	 BoYnBoukDou6aiVsol+Dr8wTfOly1WWkRy6GlfUHv1mYZwbZ1FeIpLezA8zarVShQP
	 3rNfz15Z3WmV0lxfhWcBNhvDC7deWaTF8h45AezOLvnucrdI625t9LOrZD3VfE7Xmu
	 JvzJbOAJUZ3RFiSejBLxfgGuanRBROofjZlpyYaEr1j+CqghPjfyY+xju+Ipb89nik
	 mb6+WBNJ9WgUkjIXCyh7/BLzwSx8PwkDlbVTUtRMb3VluZhgSQaAHlU9eB6uaweRND
	 p1xLlcCgAt5VA==
Message-ID: <c7c321a6-18ec-43da-bf7b-bb545af08cc9@kernel.org>
Date: Fri, 16 May 2025 16:10:04 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/nouveau/dp: convert to use ERR_CAST()
To: zhang.enpei@zte.com.cn
Cc: lyude@redhat.com, airlied@gmail.com, simona@ffwll.ch, airlied@redhat.com,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20250515201108576jof-gkjSxRfMaGDgKo-pc@zte.com.cn>
From: Danilo Krummrich <dakr@kernel.org>
Content-Language: en-US
In-Reply-To: <20250515201108576jof-gkjSxRfMaGDgKo-pc@zte.com.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/15/25 2:11 PM, zhang.enpei@zte.com.cn wrote:
> From: Zhang Enpei <zhang.enpei@zte.com.cn>
> As opposed to open-code, use ERR_CAST to clearly indicate that this is a
> pointer to an error value and a type conversion is performed.

Applied to drm-misc-next, thanks!
