Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 374D51C54A2;
	Wed, 28 May 2025 11:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748433045; cv=none; b=QO44BRGDvaX/BtDtGKt1ZqC02sWQ3IJJfE0MkgCS7pADX+o3raEszp7CuO/CIzU3hNbLWoONWhyySanQ/0miD1A8iwpnEJ5aXDnJ+SeVCo/8haAKzcoFcPeltGZ6VUVWrmRUCEftOPXzfcuCeOlUH1B8z/fr239M8+klNWLMG3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748433045; c=relaxed/simple;
	bh=pYmp7MzPa8KMqf8s7VdAs2RHMvAaS8POb29yg4AT8vM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXOhNIZtUKw75f+Ekci3OJFWqDJN8TdvWl3jkLxjE6BVQpqONxbTdwCOIQis++KrlE7h/pSAEbVLvP/5YSxEOZ6NbVt+rZV+EqeV9qGUAxXSY9x9G5lYQRoLgGQQ8lqYtlNmGv8Xet60p7KOIa9pvnZkw2g5v3fmPqx5ghddrnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y4uRdP2d; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y4uRdP2d"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9866C4CEE7;
	Wed, 28 May 2025 11:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748433043;
	bh=pYmp7MzPa8KMqf8s7VdAs2RHMvAaS8POb29yg4AT8vM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Y4uRdP2d22ovVXseVEnjBccqoRT2KVrL7bZgLPtqOVYspszPXSNm+vOhlC38MgldO
	 8Xvd+pAky2k2hj1+GcVi/vYNVnd5YDkwIY/+CDG8T6XWfK+RaD+f6xYvyAiBnjKYDH
	 XMHn2hNFFrRWQw2Hb7ttoGJhBaYY/lo/nw/hY7uOtBMwIjRexCOoHRB1UOuyoVHw3q
	 Fsyrkn+6bNsoyS+2yLqSDAaJsWbKDtDgvgXMj+4B21AsSrSBC2iZt+Ueb0WvTW4sb8
	 1+0ZvTJVzop+O3KcKSGmGxa7dsgNycqEL9NyJj9IDCIveb9gW/HU8SePKlCM9BWvZn
	 omPb6u61dSCUw==
Message-ID: <7e02b0ef-2470-454b-81df-810602d8a626@kernel.org>
Date: Wed, 28 May 2025 13:50:40 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/4] firmware: stratix10-svc: Add initial support for
 asynchronous communication with Stratix10 service channel
To: Mahesh Rao <mahesh.rao@altera.com>, Dinh Nguyen <dinguyen@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Matthew Gerlach <matthew.gerlach@altera.com>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250526-sip_svc_upstream-v3-0-6a08a4502de3@altera.com>
 <20250526-sip_svc_upstream-v3-3-6a08a4502de3@altera.com>
 <3a76c7b1-ce02-41eb-a4c0-ae065e9b99f3@kernel.org>
 <0f74ed36-13bd-4b6c-9d5e-f52cc25235f8@altera.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <0f74ed36-13bd-4b6c-9d5e-f52cc25235f8@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 28/05/2025 12:29, Mahesh Rao wrote:
>> ...
>>
>>> +	args.a0 = INTEL_SIP_SMC_ASYNC_POLL;
>>> +	args.a1 =
>>> +		STRATIX10_SIP_SMC_SET_TRANSACTIONID_X1(handle->transaction_id);
>>> +
>>> +	actrl->invoke_fn(actrl, &args, &handle->res);
>>> +
>>> +	data->status = 0;
>>> +	if (handle->res.a0 == INTEL_SIP_SMC_STATUS_OK) {
>>> +		return 0;
>>> +	} else if (handle->res.a0 == INTEL_SIP_SMC_STATUS_BUSY) {
>>> +		dev_dbg(ctrl->dev, "async message is still in progress\n");
>>> +		return -EAGAIN;
>>> +	}
>>> +
>>> +	dev_err(ctrl->dev,
>>> +		"Failed to poll async message ,got status as %ld\n",
>>> +		handle->res.a0);
>>> +	return -EINVAL;
>>> +}
>>> +EXPORT_SYMBOL_GPL(stratix10_svc_async_poll);
>>
>> No, drop entire function. There is no user of it. You cannot add exports
>> for dead code.
> 
> These functions have been newly introduced for the Stratix10-SVC 
> platform driver. The client drivers that will utilize these APIs are 
> currently under development and are planned for inclusion in a 
> subsequent patch set. Would you prefer that I include a sample client 
> driver using these APIs in this patch set instead?

You must have user for every exported symbol. In the same patchset, usually.



Best regards,
Krzysztof
