Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942A0380
	for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 18:42:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749667322; cv=none; b=fNK6HszNf9EOfzG1rjnxc/UtCmsVr9AxjmWimTxSdvYypIl0Xk1wpaknk5ROLaqYOfKnp/Jfr3Yyk2wzN9538QmLWZ1w+Joh9kF50yDreBOb8N5+oS8eT7eb1cjK/bqQ3Vij/oFzRso3HTI7QG+CJmDcJz8jfysTfnZguAkSEZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749667322; c=relaxed/simple;
	bh=CkHxhlfuBpVaK4GXCF8g07K/ObYJP2txf0W3iqQi/X0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q4bSquDPUwUZq+GExxjC4BIbykUZ+c8tINSxTCd1kSbbXSYPLhS5xyYdPqwXk7Q1AeFhz55p8LDN/sDIGWnbKKdkUzNW4zhJmct3U/0TNT7NFYeqLLrW9+Lxb9rjqga/j8794NzwTS5OaFY/FwiD2yO6U9owHWa2qeun9ZYHzk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=f8H2CDZw; arc=none smtp.client-ip=209.85.221.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="f8H2CDZw"
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-3a507e88b0aso219862f8f.1
        for <linux-kernel@vger.kernel.org>; Wed, 11 Jun 2025 11:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749667319; x=1750272119; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=WKfrpUvrdAwcpn30SJ8EKISnxqjztsTWvvkV9uw1jUs=;
        b=f8H2CDZwlvpmnVM8mlBffYmWjzd3wwn5MySf/i0lnfG+i47UvG09/ma8OreItS1jJ9
         bnIEmEJSt38Ehpc4y14TKsPueQ4H+awxjI3AkVhzlWiVmQbZR7H/5JAxL8jJI5cn270b
         HmyNVGKRyfVazTAf0OI4cAF0FPUyNO0jGq08jnh70BTq3/H8pNByXU/15/Rh+b5AFwAC
         jjEXytIsVrmu9MXt18Ci432+wrEgDXOy8yb2+QONCz29blACWERrN+1u/ccNLz+9DbUl
         c5bf5+yUiuuiarPi4ceYHtmu3ZKHQeRIhUmeRFXnTKU9A19d1Mc6p+I+zSBV+W3OjhTM
         jhqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749667319; x=1750272119;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WKfrpUvrdAwcpn30SJ8EKISnxqjztsTWvvkV9uw1jUs=;
        b=Vd7KUHggyOak3qnvbcQItnz4BOMDDEl7eNvTSafB4OYjrl0PaLz7Q05qGimPkNHqEq
         55u74rW93wzYktYKXxPnK2LLD0vxyuGeeT14DU3c3foEEVASTyazmQb9Ro1nUSPttx6m
         znci/7UZyRpVDoz5XlIjPYVLciMhE9z1WauhZzG8TW6LN3b5psj7wl/Y6nGGResgfpbK
         VEPZak1I/4Ou4aBG7mdLUpnERyp+4AjKh/Q1pmUn6nYyPlRv020QQqn8PNxycULza2R7
         sRkcEeupWoeJQKS9cQxK+l5+2oWV2x2HxzQFwLJks9HE5zvSCfbmQeq7hoh1eZHDyzG7
         0Ghw==
X-Forwarded-Encrypted: i=1; AJvYcCWUM6VMHPM1GZYrbGb9fMozLqSs6UdJrkLYKl4ISCrYtMf0Yfi63WehT77DfsAk/VwLWMQekFFmS9QdkOc=@vger.kernel.org
X-Gm-Message-State: AOJu0YybEmYBs2eDZ3GzH2FYnhVZ+m4aA0Rr4HKaHcBGhJSEw4fAmCOE
	dXgkF2cbNMu3Dbb0SIsrta6PS8LNF5YWqrOORseyFfByEensGosWzllrh2p6ufHqCtk=
X-Gm-Gg: ASbGnctXBfz2WY8tubqiM3tlYMGQ/ksYxYpJ4EvfDEGmfuwjdqYsbzIOPPvdnskjube
	f8l3kKThL9vSSJwOC/MC5P7nGddyu5EPSqrVlw/p1TiNaZS3c21mdyWIJu4+Xoaxg+Dc1N12M4P
	8n5wK05Wz9WoGcMUuOLEY+lLLFtN6h2UVbyPtJFADKwZuhtfygwg8eod8VrMzpTn2L4HUqq1TVg
	aq0pfGuJZH78Ed94wlJtcC9Qme6aSammnN7NoSqh4Yl3MVkpvrWpT8E26MKL/DLHrck18aOWyAu
	P2TtN27jFVJbdzO5pwh0OeS/XYg0ASg2KyZ1tMh2CrQTUygHY63lq/c61vJ3cRatnTQ=
X-Google-Smtp-Source: AGHT+IE8IO3x5kgMMLjG88ZEq35UY3RD1TsJ71KI+PrQeFiKWv1nPP47wXf32YYs9T5iAq6yC36tgA==
X-Received: by 2002:a05:6000:2207:b0:3a0:b940:d479 with SMTP id ffacd0b85a97d-3a560809a92mr423897f8f.53.1749667318953;
        Wed, 11 Jun 2025 11:41:58 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3a53229dc33sm15903289f8f.20.2025.06.11.11.41.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Jun 2025 11:41:58 -0700 (PDT)
Date: Wed, 11 Jun 2025 21:41:55 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karan Tilak Kumar <kartilak@cisco.com>
Cc: sebaddel@cisco.com, arulponn@cisco.com, djhawar@cisco.com,
	gcboffa@cisco.com, mkai2@cisco.com, satishkh@cisco.com,
	aeasi@cisco.com, jejb@linux.ibm.com, martin.petersen@oracle.com,
	linux-scsi@vger.kernel.org, linux-kernel@vger.kernel.org,
	jmeneghi@redhat.com, revers@redhat.com
Subject: Re: [PATCH 2/5] scsi: fnic: Fix crash in fnic_wq_cmpl_handler when
 FDMI times out
Message-ID: <aEnN8x59OdWMqRP6@stanley.mountain>
References: <20250611183033.4205-1-kartilak@cisco.com>
 <20250611183033.4205-2-kartilak@cisco.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250611183033.4205-2-kartilak@cisco.com>

On Wed, Jun 11, 2025 at 11:30:30AM -0700, Karan Tilak Kumar wrote:
> When both the RHBA and RPA FDMI requests time out, fnic reuses a frame
> to send ABTS for each of them. On send completion, this causes an
> attempt to free the same frame twice that leads to a crash.
> 
> Fix crash by allocating separate frames for RHBA and RPA,
> and modify ABTS logic accordingly.
> 
> Tested by checking MDS for FDMI information.
> Tested by using instrumented driver to:
> Drop PLOGI response
> Drop RHBA response
> Drop RPA response
> Drop RHBA and RPA response
> Drop PLOGI response + ABTS response
> Drop RHBA response + ABTS response
> Drop RPA response + ABTS response
> Drop RHBA and RPA response + ABTS response for both of them
> 
> Reviewed-by: Sesidhar Baddela <sebaddel@cisco.com>
> Reviewed-by: Arulprabhu Ponnusamy <arulponn@cisco.com>
> Reviewed-by: Gian Carlo Boffa <gcboffa@cisco.com>
> Tested-by: Arun Easi <aeasi@cisco.com>
> Co-developed-by: Arun Easi <aeasi@cisco.com>
> Signed-off-by: Arun Easi <aeasi@cisco.com>
> Tested-by: Karan Tilak Kumar <kartilak@cisco.com>
> Signed-off-by: Karan Tilak Kumar <kartilak@cisco.com>
> ---

This needs a Fixes tag and a CC to stable.

regards,
dan carpenter

