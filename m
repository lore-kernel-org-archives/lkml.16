Received: from pv50p00im-tydg10011801.me.com (pv50p00im-tydg10011801.me.com [17.58.6.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818F41EA80
	for <linux-kernel@vger.kernel.org>; Thu, 10 Apr 2025 00:50:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=17.58.6.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744246260; cv=none; b=O7YRCCCSRBO68NELrpBnEuzlC7DsGVEpPeGCnhO/xWPzOHIXGsoppLwQysXr+yelVZ7zvXSD5DRiwYHaWfne4CeIOeqzNTbNx9VLLw9MuFak7xTbCLhKFpT8BBR+mwAMdar16148eS0iRQtArRvxI8dkC5iruIEvF7JCDl1H8yE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744246260; c=relaxed/simple;
	bh=VrjcwHCUg5dCeKPbZz+emw/iuRN3YC2fs/0+F+3D+tk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uv2qcs7B34k/0oYBQBokrlCrz1TZl1+e7Ydn2w2803xvHk9stB6zA4I8YF6+ak0SS6hQpKCKvvz7hm1i3DA3byrT6nPtq6Xxwm62TzRYBjXtA+HqGDIG7fi6n7XVBMicD/EGvJfOIhid4gJYvuPxJHHgrS++lQl5eBajWwaIaA0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=sufCOgTT; arc=none smtp.client-ip=17.58.6.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="sufCOgTT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=BeKHta/udR8KX7M6EhKvHmogccj10B6Md6MMKith8pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:x-icloud-hme;
	b=sufCOgTTb5U+iybi2WXhJt1a90UWz/B84WGhd5jF1ovwOZmfoaNzYlkW7nYBEzWA8
	 dfoU2M+UP0hJPBnqBs5V83/ixVhTyjeeoCS+jvAzD6f2shKksslZnFb3E10GJzhtPi
	 +iivQbCmuFeQFV9ArILYLhk2kH3m5ohREGW4l6ehqI0qn/GW04wgvDU6R0CrHvmS9C
	 PJyJbGwlPwdrdZ+DfbqZOpDi6HtSu5X8EwTYnqcvLwlHnzpmDHxiQypaXYJa7n7T4p
	 jyP9ZRk6w3UJDfXV5IZ03w/T9HaqzJinCc5TpYt3febh3UgCE7iV+Rhcyz0C7SSyAP
	 PobXqVV6Hv/tg==
Received: from pv50p00im-tydg10011801.me.com (pv50p00im-tydg10011801.me.com [17.58.6.52])
	by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPS id 92F368001EE;
	Thu, 10 Apr 2025 00:50:56 +0000 (UTC)
Received: from [192.168.1.26] (pv50p00im-dlb-asmtp-mailmevip.me.com [17.56.9.10])
	by pv50p00im-tydg10011801.me.com (Postfix) with ESMTPSA id 4F5E880028C;
	Thu, 10 Apr 2025 00:50:53 +0000 (UTC)
Message-ID: <057db64d-04de-45fd-b1e6-ede46fa6923a@icloud.com>
Date: Thu, 10 Apr 2025 08:50:49 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next] sock: Correct error checking condition for
 assign|release_proto_idx()
To: Kuniyuki Iwashima <kuniyu@amazon.com>
Cc: dada1@cosmosbay.com, davem@davemloft.net, edumazet@google.com,
 horms@kernel.org, kuba@kernel.org, linux-kernel@vger.kernel.org,
 netdev@vger.kernel.org, pabeni@redhat.com, quic_zijuhu@quicinc.com,
 willemb@google.com, xemul@openvz.org
References: <20250408-fix_net-v1-1-375271a79c11@quicinc.com>
 <20250408182116.45882-1-kuniyu@amazon.com>
Content-Language: en-US
From: Zijun Hu <zijun_hu@icloud.com>
In-Reply-To: <20250408182116.45882-1-kuniyu@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: QW_CSOwNFW1AyOI-XR7XmKTbtl1kobjV
X-Proofpoint-ORIG-GUID: QW_CSOwNFW1AyOI-XR7XmKTbtl1kobjV
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-09_06,2025-04-08_04,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 clxscore=1015 spamscore=0
 suspectscore=0 phishscore=0 adultscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=999 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2308100000 definitions=main-2504100004

On 2025/4/9 02:21, Kuniyuki Iwashima wrote:
>> diff --git a/include/net/sock.h b/include/net/sock.h
>> index 8daf1b3b12c607d81920682139b53fee935c9bb5..9ece93a3dd044997276b0fa37dddc7b5bbdacc43 100644
>> --- a/include/net/sock.h
>> +++ b/include/net/sock.h
>> @@ -1421,7 +1421,10 @@ struct prot_inuse {
>>  static inline void sock_prot_inuse_add(const struct net *net,
>>  				       const struct proto *prot, int val)
>>  {
>> -	this_cpu_add(net->core.prot_inuse->val[prot->inuse_idx], val);
>> +	unsigned int idx = prot->inuse_idx;
>> +
>> +	if (likely(idx < PROTO_INUSE_NR))
>> +		this_cpu_add(net->core.prot_inuse->val[idx], val);
> How does the else case happen ?

thank you for code review.

provided that @prot->inuse_idx will never be used if @prot fails to be
registered.

will remove this check in v2.
