Received: from fanzine2.igalia.com (fanzine.igalia.com [178.60.130.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0768E20967A
	for <linux-kernel@vger.kernel.org>; Mon,  3 Feb 2025 15:46:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.60.130.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738597577; cv=none; b=IGFPFFS+2dgtB1reVF+CD7jfLySFg3OHlW2F+9YpYO/9mJjPmDvQ3dGr01r5qpUrjLuaGMHHjJeXZdaI5qip9v3bTGKu8FcPwl8PZoyikf4KjFQ03HQgJGTD0bdEzDUf40HLf/NcCsolMUNC4LISviaOnMBy4zxHkKdnMs3emH4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738597577; c=relaxed/simple;
	bh=VUDFAoH2yWf/eG9Odxs/zyBPuh7h8+lxwkoJs2sMwwc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lqbxP4Yl6u/TT9rOJN6zuIF7U+vrwzPFmxPiQTv2QJxwa69RN5YNxV9zUpjnRtLXP30vAd+xFTzULJIvm+eWfg2X/PZeE/4MxZNC0+wE6sgM5kJaBejFeYleV0d0FO+dcNQZf27h4LQDUAzOON7J9X6XukLm+/+sSE6tfvMqGfc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com; spf=pass smtp.mailfrom=igalia.com; dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b=f6vRSukE; arc=none smtp.client-ip=178.60.130.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=igalia.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=igalia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=igalia.com header.i=@igalia.com header.b="f6vRSukE"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
	s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
	References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=VUDFAoH2yWf/eG9Odxs/zyBPuh7h8+lxwkoJs2sMwwc=; b=f6vRSukEthrlkNZoRN0gQ8r6X2
	H3+Z8wE0mGiMDBbn5Abzo9KR2QnuK+azNRLZaCpKoaLUvLsSshytbmKCvLtxcSDTyQeEyP6jSjoEe
	437OUAMSolYyVpxxFHRwEmV2p7ASbq69o0oiuaa0s7iXN9rIEEikKI4a71SH3qV+ptDV3MyiGH7QE
	gBeDnUJsjSt8zRNUoq35lYrKAlYpPY6182+nbdOoJ7wr/iaEhFEAxem6/S0lgy+7F7JN3pXcBWJM1
	h23aVqqSdFANzFoumN5gp7EdN2NxinMvz1gpR/+Vs1xmqj9Qv+clY8SYWbEf6VQQiwNyUbTY2IZPH
	MmdK5nEw==;
Received: from [58.29.143.236] (helo=[192.168.1.6])
	by fanzine2.igalia.com with esmtpsa 
	(Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
	id 1teye9-00369h-0s; Mon, 03 Feb 2025 16:46:07 +0100
Message-ID: <2add5e06-811c-44af-904a-3bb75521512f@igalia.com>
Date: Tue, 4 Feb 2025 00:46:00 +0900
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 05/11] sched_ext: Add an event, SCX_EV_ENQ_SKIP_EXITING
To: Tejun Heo <tj@kernel.org>
Cc: void@manifault.com, arighi@nvidia.com, kernel-dev@igalia.com,
 linux-kernel@vger.kernel.org
References: <20250131070938.95551-1-changwoo@igalia.com>
 <20250131070938.95551-6-changwoo@igalia.com>
 <Z5-pTOjBwsQRB0OF@slm.duckdns.org>
From: Changwoo Min <changwoo@igalia.com>
Content-Language: en-US, ko-KR, en-US-large, ko
In-Reply-To: <Z5-pTOjBwsQRB0OF@slm.duckdns.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hello,

On 25. 2. 3. 02:20, Tejun Heo wrote:
> On Fri, Jan 31, 2025 at 04:09:32PM +0900, Changwoo Min wrote:
> Missing agg call?
Ah, you are right. Will fix it.

Regards,
Changwoo Min

