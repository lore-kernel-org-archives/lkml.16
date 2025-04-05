Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD399748F
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 00:33:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743813229; cv=none; b=UwqWh12dSoADI4NZDX1bIu3V8tIOme3Gj1Tda2plNIAMqwnqhBq3691MrbF0bKY8HWJKIfJOgvdgeSBNbT9U1MfTO4fcbq8+xky/aBv3yaurSS0SZxU715jVyQwe+iJtVXPyiGmrga36s9b6enz0ijW9XSMpayQqD8pT3HaRiKo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743813229; c=relaxed/simple;
	bh=CQJRQ11RqfvELfWpJQkseDZvm3TQu1lz6j3vtH3TxYU=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=CkZLvbYwKrq5QJ9Dwr2bI6tTA9+0R28GGtKPMFVwDwDclJZ4yU7f1IAVQow79unQRf5OTLe6p1iQrJmbpqbhNbTOEhqGsArMYEUNC9NwkcGhK8d0eDsFp7zvJ2I+O0VWKNK8r7E1dRMtBCBYGBsK1Sg+oL6rj7DQPAxXMHRCjNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=asNUaDHJ; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="asNUaDHJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=CIP45yUlml7IuIoe9Z3XWr8F+65YLSo36Wrup9WoaCo=;
  b=asNUaDHJj7ezB4IPOB2dlEYeiPHLQnV7KhgKf8Y+2RIOTidlWfK2W/Y6
   dr8VvRdqdvpl0E2irATXVbcrk85ukUWc6vGEu3yitgQm0dSB66d1QSdnP
   o36m/8zAyNHj3o7CQpUCx+xcnNlRDcrX92uw+DPEy5fjLzGs8uAkwPbiU
   8=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,189,1739833200"; 
   d="scan'208";a="113511471"
Received: from unknown (HELO hadrien) ([50.225.219.62])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 02:33:37 +0200
Date: Fri, 4 Apr 2025 20:33:33 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, julia.lawall@inria.fr, 
    andy@kernel.org, dan.carpenter@linaro.org, linux-staging@lists.linux.dev, 
    linux-kernel@vger.kernel.org, outreachy@lists.linux.dev
Subject: Re: [PATCH v2] staging: rtl8723bs: Use % 4096 instead of & 0xfff
In-Reply-To: <Z/B019elTtKG/PvD@ubuntu>
Message-ID: <2d2dbebf-b4bb-74c0-14cd-b7ffbe3894e4@inria.fr>
References: <Z/B019elTtKG/PvD@ubuntu>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 5 Apr 2025, Abraham Samuel Adekunle wrote:

> Replace the bitwise AND operator `&` with a modulo
> operator `%` and decimal number to make the upper limit visible
> and clear what the semantic of it is.

I think that the & and the Fs are more understandable than using the % and
4096.  I would say no for this idea.

> Also add white spaces around binary operators for improved
> readabiity and adherence to Linux kernel coding style.

The "Also" is a hint that you are doing two things.  So they can be in two
different patches.

julia

>
> Suggested-by Andy Shevchenko <andy.shevchenko@gmail.com>
>
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> ---
> Changes in v1:
> 	- Added more patch recipients.
>
>  drivers/staging/rtl8723bs/core/rtw_xmit.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 297c93d65315..630669193be4 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -943,7 +943,7 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>
>  			if (psta) {
>  				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
> -				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> +				psta->sta_xmitpriv.txseq_tid[pattrib->priority] %= 4096;
>  				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
>
>  				SetSeqNum(hdr, pattrib->seqnum);
> @@ -963,11 +963,11 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>  					if (SN_LESS(pattrib->seqnum, tx_seq)) {
>  						pattrib->ampdu_en = false;/* AGG BK */
>  					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq + 1) % 4096;
>
>  						pattrib->ampdu_en = true;/* AGG EN */
>  					} else {
> -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
> +						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum + 1) % 4096;
>  						pattrib->ampdu_en = true;/* AGG EN */
>  					}
>  				}
> --
> 2.34.1
>
>
