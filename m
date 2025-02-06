Received: from 009.lax.mailroute.net (009.lax.mailroute.net [199.89.1.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 943E222258C
	for <linux-kernel@vger.kernel.org>; Thu,  6 Feb 2025 21:44:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=199.89.1.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738878258; cv=none; b=Nkgs4ruIzsWcocjTx7JMDHFOr3wo7T0Ctuu+DJrGXa039YJynPKf5L41gvWw6/ZdOs4RCriBP1Q7QA4zKROFGxnZy6TIKopRiQdLtAZlD8HCB7kfmDnP0tdwXRZI4OhUuwGFykrkSjyrXNWocisxZEh7nfpBDJol2f9vdmydWfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738878258; c=relaxed/simple;
	bh=oD5dOF73AKxvo3T9Rd+ez5l8UKs1H5O+DfmFrTTDlX8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sSY4SlKl13kjRQUQHF6D2Pt9Mp86KwRWN80aWxrnGsiX/2eqaoRZ/k4y1k+pV5Ecpeh3Pr1zM8OtZDw2QmYPZXj82zzZM/MvCBaAEWovg2UM0ry6oDop2Kjo+lOob6yogjaG5mUpLQQWbNR5FWH0OS9GuT+TqRnvGnYVP+XmVl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org; spf=pass smtp.mailfrom=acm.org; dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b=GaWgb0Nw; arc=none smtp.client-ip=199.89.1.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=acm.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=acm.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=acm.org header.i=@acm.org header.b="GaWgb0Nw"
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4YprGQ6dPHzlgTwF;
	Thu,  6 Feb 2025 21:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738878248; x=1741470249; bh=d52uhFs6xmGRbyZR3Agrgx1/
	cRrEZCyMQ+o2UTJkXXw=; b=GaWgb0Nw+AqhbYJqhPB1t5ZtHu64jNvVt8vuh5TZ
	N4IyO0x3jYJZLpY0qmiVUBvwu0GykgDiSQZIVAr2DK3+5+Abw1yKRhGI97egq4Rw
	V6m682nvhjMtyQYhR6A9xygXieinO5A8eSjyCsKYbNjRpK20baSdFcxHua8utbOw
	PLX3Rdr+20R/UgaMhpSYVssXXHUrkTvctpvhpmhnHq9ylwQVFoUdKK98M5BchRcS
	DdoMCkat1IQ23Po1ml0Q9DrbDSGOHEwb335+rwg1SuACVZPFcHXXTgDGH6PIq1vT
	x6OJnU/HPlMPWabuqQFsNkafFF+g6fuJdtjJvOeSG1XYLA==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id xzW7InQq7SeI; Thu,  6 Feb 2025 21:44:08 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YprGF4vgRzlgTw4;
	Thu,  6 Feb 2025 21:44:05 +0000 (UTC)
Message-ID: <60f01052-44aa-4b3f-a116-f31635dffb17@acm.org>
Date: Thu, 6 Feb 2025 13:44:04 -0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 15/33] ice: Fix a locking bug in an error path
To: Tony Nguyen <anthony.l.nguyen@intel.com>,
 Peter Zijlstra <peterz@infradead.org>,
 "Dave.Ertman@intel.com" <Dave.Ertman@intel.com>
Cc: Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marco Elver <elver@google.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
 Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <20250206175114.1974171-16-bvanassche@acm.org>
 <61e3cc7a-af79-48e4-acb6-8ac7c8d2552c@intel.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <61e3cc7a-af79-48e4-acb6-8ac7c8d2552c@intel.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 2/6/25 1:35 PM, Tony Nguyen wrote:
> On 2/6/2025 9:50 AM, Bart Van Assche wrote:
>> Do not unlock pf->tc_mutex if it has not been locked. Jumping to
>> 'dcb_error' causes pf->tc_mutex to be unlocked. This bug has been 
>> detected
>> by the Clang thread-safety analyzer.
> 
> Thanks for catching this Bart. I think it would be better to move the 
> tc_mutex up to cover this call. Though unlikely, the DCB settings could 
> change after this call so it would be better to protect this under the 
> mutex. Also, as the error path is changing configuration, that should be 
> done under this mutex as well.

Thanks Tony for having taken a look. Is this perhaps the change that you
want me to make?

Thanks,

Bart.

diff --git a/drivers/net/ethernet/intel/ice/ice_dcb_lib.c 
b/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
index a7c510832824..d185b1aba7a4 100644
--- a/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
+++ b/drivers/net/ethernet/intel/ice/ice_dcb_lib.c
@@ -537,14 +537,14 @@ void ice_dcb_rebuild(struct ice_pf *pf)
  	struct ice_dcbx_cfg *err_cfg;
  	int ret;

+	mutex_lock(&pf->tc_mutex);
+
  	ret = ice_query_port_ets(pf->hw.port_info, &buf, sizeof(buf), NULL);
  	if (ret) {
  		dev_err(dev, "Query Port ETS failed\n");
  		goto dcb_error;
  	}

-	mutex_lock(&pf->tc_mutex);
-
  	if (!pf->hw.port_info->qos_cfg.is_sw_lldp)
  		ice_cfg_etsrec_defaults(pf->hw.port_info);


