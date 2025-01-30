Received: from e3i103.smtp2go.com (e3i103.smtp2go.com [158.120.84.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83D631B392A
	for <linux-kernel@vger.kernel.org>; Thu, 30 Jan 2025 08:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=158.120.84.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738227194; cv=none; b=hXVEJGseKDP7YsTaIqT/wI5xdiylvjItgiOnGA2ReYv6lVkTrnlF3JPsa/trDXgC6oDacD+2wQoksDoVeOoeKynsOVcDjyHmnMrMtC6N2lw5LSvqOPg548HirBDOB0hBr9kRSmCG6kwo+BWZGdPF8aNtxX7wJL4upLZQPE1cU3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738227194; c=relaxed/simple;
	bh=XzxeJ4XPzzp0usFqTbZ0M1nRoFpn4ZTZJon5i7ounms=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jEiKN55GgNR2r2SaDLjLgP4b94NOPUeFX87XoTlW2nizL+P/qLknT/TXu7oKSFGHRyezaHt9mMWoABHc3KWJZ2vOSX+nkmzTKSX6qj7UUyhJEBx1FxjwwlICMWeYOciO9jcha1A473v9y6MM0OtNaZGMHI7ydDPAx9LGPyQKte0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt; spf=pass smtp.mailfrom=em510616.triplefau.lt; dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=WyMZaERB; dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b=HJjnR/ST; arc=none smtp.client-ip=158.120.84.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em510616.triplefau.lt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="WyMZaERB";
	dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b="HJjnR/ST"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1738227190; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=ztTkXggYlobgx0epsppi5S+4LOlRnswYqg61lPztKMQ=;
 b=WyMZaERB56z75Q5isS/YFJoLT9QzsoojMtI5IBBulgoWpDqILgrdRibLJMEcQrOMOjjC7
 HNFNYWUFE9ONQh75rHsAlIG/rzN79KTsyg7a18XVInvCnL/+pPv75mj349ZNbljxtNmW+gB
 cDT5LcSdjab9ASLywpxPU10ps8TRwmqXWfzngXMqWAd5Xbu7v5UxrecGuOgoaDTsuNiTXwU
 toL6u7NxTzyxYqoup4Oxl5Fmou3vmUva1PlKd3zF4LCQI0Bpp8stChLGzhrg+IOTTLWXCM8
 vft7ugZneRLKVM5YAqlr/rhsmpzkqICeAC8LM3VDUDJcC5wuASx1PHCSdo6g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1738227190; h=from : subject
 : to : message-id : date;
 bh=ztTkXggYlobgx0epsppi5S+4LOlRnswYqg61lPztKMQ=;
 b=HJjnR/STlBRPlqKt6rmS9qPYVd8zhEVgMRGCi0R7ba7lAtIhfAtFrU72020oLpcwkPGXn
 W+nwQzBAFHlMW8mjI7BX0nI14JzLqgabOClFYIQS6gKy0RNr22diMC+LkRMT9RWw9kLjuuS
 9OWV/L8/O7uVtQNnxQCz/Ty3DiLy82Lznhr9C0MVBoVCtBxEJ84tPxgKl8XdiLciDCyBQBT
 I5/guwwTc1/XhLi/OXYlzteBaHyQdi4Rx1FAG6819r4Qtsm5gZptjM0oRzN9Vrz4XODvONv
 M1up3w1rhXglLf6t1KhjtXXflVz21Y47evn0ABAe0rzvVNr8HDhVRqyvLiHg==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1tdQIF-4o5NDgrn3Ce-oqLA;
	Thu, 30 Jan 2025 08:52:59 +0000
Date: Thu, 30 Jan 2025 09:49:12 +0100
From: Remi Pommarel <repk@triplefau.lt>
To: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org, Kalle Valo <kvalo@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>
Subject: Re: [PATCH v2] wifi: ath12k: remove return for empty tx bitrate in
 mac_op_sta_statistics
Message-ID: <Z5s9CO_mmazq2Kg1@pilgrim>
References: <38c2a7c4f7eaf57b9306bb95a9e6c42b7d987e05.1738169458.git.repk@triplefau.lt>
 <9c12e9b9-35a4-47f1-bd17-6b4641de92a4@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9c12e9b9-35a4-47f1-bd17-6b4641de92a4@oss.qualcomm.com>
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616sX7BLYLfdb
X-smtpcorp-track: e7yux4zfAlao.n8KQ9m9WVgkW.EHAiZwD0NQG

On Thu, Jan 30, 2025 at 12:21:54PM +0530, Aditya Kumar Singh wrote:
> On 1/29/25 22:25, Remi Pommarel wrote:
> > Currently in ath12k_mac_op_sta_statistics() there is the following
> > logic:
> > 
> >      if (!arsta->txrate.legacy && !arsta->txrate.nss)
> >          return;
> > 
> > Because ath12k_sta_statistics is used to report many info to iw wlan0 link,
> > if it return for empty legacy and nss of arsta->txrate, then the other
> > stats after it will not be set.
> > 
> > To address this issue remove the return and instead invert the logic to set
> > the txrate logic if (arsta->txrate.legacy || arsta->txrate.nss).
> > 
> > The same was done also in both ath10k with commit 1cd6ba8ae33e ("ath10k:
> > remove return for NL80211_STA_INFO_TX_BITRATE") and ath11k as well with
> > commit 1d795645e1ee ("ath11k: remove return for empty tx bitrate in
> > mac_op_sta_statistics").
> > 
> > Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> 
> MISSING_BLANK_LINE
> 'Tested-on:' tag missing blank line after it.
> 
> You missed v1 comment? :)

Yes sorry I think your mail never reached me, did you CC me ? Do you
need a respin ?

-- 
Remi
