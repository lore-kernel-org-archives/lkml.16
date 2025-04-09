Received: from out-174.mta1.migadu.com (out-174.mta1.migadu.com [95.215.58.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FE2C33EA
	for <linux-kernel@vger.kernel.org>; Wed,  9 Apr 2025 10:09:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744193360; cv=none; b=Wh2HAz3V6Rj587zREDvHcI9bl+hp3LOe1DyeTuDUnVQcGpf/2Cu6zTEiB/bdVyx4jXn6OYa9/rwhHtar5tNdbogWoBex1Gyp58wCnRgh7K/h9W/pHSueVzdNuiDbMwPbwHg0+q2ZqsKysoNHmQeRvSpr4/qfkOIieYpdntHxPDg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744193360; c=relaxed/simple;
	bh=c9DuTSaPjiO8StDDsOMg3WMYUwFIi3AqQOH/c0eCiCg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SGoDyToWF5TrUZTOHrequXv2LdydL1kpkfj++lHv5j0I7AUO/czxwdItIzrrFEUvgYk8AGNtDF3u+YSYcpP13AMLscyMt3y3cHNC0eu0i2zKMXUppLdVdhqZcwJomkh0ACRyIJfuZo6DML+eU7pGHTnjfU4VN2+6UHx3enoIKC4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=wvo+hPan; arc=none smtp.client-ip=95.215.58.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="wvo+hPan"
Message-ID: <b772404d-ef1f-4ca2-a7a8-e3fe7762dd8c@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1744193355;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=r3Osk/xwKtmBgpfhItgZqw/w4soU25CKVKTCKayJfqo=;
	b=wvo+hPanftHBPyAT/EJPxMtZa+uMbwcJauyG+wy5u7oNwXMj62DEhCO0B6k84VJyPr1hq2
	pfeygywI1oBum0SKToM8q7RC9d8cIGN6Ko1Enc7YEgoOJ3qsBu+uiUCGKPdoLQbBOGolRs
	8dVCC+T+WlkNWxpr2/RhMOwnUn5gdw4=
Date: Wed, 9 Apr 2025 11:09:12 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCH v1] ptp: ocp: add irig and dcf NULL-check in
 __handle_signal functions
To: Sagi Maimon <maimon.sagi@gmail.com>, jonathan.lemon@gmail.com,
 richardcochran@gmail.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com
Cc: linux-kernel@vger.kernel.org, netdev@vger.kernel.org
References: <20250409092446.64202-1-maimon.sagi@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20250409092446.64202-1-maimon.sagi@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT

On 09/04/2025 10:24, Sagi Maimon wrote:
> In __handle_signal_outputs and __handle_signal_inputs add
> irig and dcf NULL-check
> 
> Signed-off-by: Sagi Maimon <maimon.sagi@gmail.com>

Reviewed-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>

