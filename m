Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 049AB823DE;
	Mon,  7 Apr 2025 06:38:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744007887; cv=none; b=CZD7ioIe+5VonFig6lcdkEZgzF0KoDD8M6myG1vCBuvU+nsS99PPhzfwHuT2utg/Jj1nbJE9tDyiWxo34azufDY+o2sk8uyANm2WTCWxJ1jlOF4hfeE2vDYwmKc5w7uSdS9ioXjPIUpwRcJVIWCp8KRBMYqWC9/w83gdsP2N/3c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744007887; c=relaxed/simple;
	bh=TQqbK7sOwuKRjkMrPbuSLr7XyT7yAd0z2T4yZVVYNsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i6kTGkdNteuVJBUMg+MAiaxkfhJnkbaxfuRKuM55eH0Ld5TUFomqkEKF5ywbmSOHIcgkn/we0JUgvceL7G8pMgo7akJ8xvAREh/OBEoq1wY1zY1o///phf9gyS0ZakaLZC4jVooQNpyhq4mRc2OTE/y1oAVFF136uyu6A6q2K7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=DIMhohUZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="DIMhohUZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0BC36C4CEDD;
	Mon,  7 Apr 2025 06:38:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1744007885;
	bh=TQqbK7sOwuKRjkMrPbuSLr7XyT7yAd0z2T4yZVVYNsU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DIMhohUZ5bOWNPq3Xrg/UD62VXTi0mgpRbNWgc4wDEd3EmSWBfwaHoQdtbv8emg/f
	 q7wz7Tcsja9zOryUwBwU9MmRro8OWZrHHVT2ehUSegPhfo2Ka9A7IvSBjZu3UM+Qv8
	 lLbmVTydvwBeQZTDeUgZ2uGk1FajukI7W42rpxd4=
Date: Mon, 7 Apr 2025 08:36:35 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
Cc: julia.lawall@inria.fr, outreachy@lists.linux.dev,
	linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, andy@kernel.org,
	david.laight.linux@gmail.com
Subject: Re: [PATCH v4] staging: rtl8723bs: Use % 4096u instead of & 0xfff
Message-ID: <2025040757-clergyman-finalist-0c63@gregkh>
References: <Z/NxGilPLPy7KSQ3@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Z/NxGilPLPy7KSQ3@ubuntu>

On Mon, Apr 07, 2025 at 06:30:50AM +0000, Abraham Samuel Adekunle wrote:
> The sequence number is constrained to a range of [0, 4095], which
> is a total of 4096 values. The bitmask operation using `0xfff` is
> used to perform this wrap-around. While this is functionally correct,
> it obscures the intended semantic of a 4096-based wrap.
> 
> Using a modulo operation with `4096u` makes the wrap-around logic

<snip>

> -				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> +				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 4096u;

I do not see a modulo operation here, only another & operation.

>  				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
>  
>  				SetSeqNum(hdr, pattrib->seqnum);
> @@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>  					if (SN_LESS(pattrib->seqnum, tx_seq)) {
>  						pattrib->ampdu_en = false;/* AGG BK */
>  					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&4096u;

This also looks odd, nothing is being "AND" here, it's an address value
being set (and an odd one at that, but that's another issue...)

How was any of this tested?

Slow down, take some time, and think about what you are wanting to do
here.  There's no rush.

thanks,

greg k-h
