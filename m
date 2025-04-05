Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 968026FC3
	for <linux-kernel@vger.kernel.org>; Sat,  5 Apr 2025 13:30:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.104
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743859836; cv=none; b=aPCLT5427ZFAhOaXRx2s1o2yjiJ5ODA+xxFja0FloTNw1Yi2AkI9eAn4SpjP4l1YjMDVh1860Nr83SCqwReJlklB9f6R6H4yc4iRI1nCwJEtqgn4mtYeYQISdnuTufN7v/TTHNUy71C4pslX5cmyWd/B6PWhXi9rHXcoFmHjX8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743859836; c=relaxed/simple;
	bh=JOrHW40c/wdD71gv/ine87UQBGNMiHaE+KSyW2J7UXA=;
	h=Date:From:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=b8ua0xDVbwxZZL2GOTlK8b0klqf6ACvH/4t5R1n2ns9RNZlhbiIBNteWsiLtbx/5l2htUHAheuKPdpKj9gj29xz2miPNsOAnb+LpB3YjF8QuerpesiPhXXHZ2CO8DbpzGrSQ9keLs4cKnkvuNCPXC7xxopQybr6MoCry4hUbbEs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=hlZAU06k; arc=none smtp.client-ip=192.134.164.104
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="hlZAU06k"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=je9cwcx6iqQa2t88dHW5/qrKP7V/BgyuZ0xSoOY+EFQ=;
  b=hlZAU06kFnHL3j4PzmF/BgSB/RVfq4tRvI5iQrvkMtorpCSZXw7ndR3g
   jU3xOM3kPsYkUwtPCEfflumgOzsv4phFz8iIdPQ6utv02ruc1MxJ6w2RH
   9VoudccMJnmfGPUhKvD3rfr2IMSufDEe85Pd+2RARK4lCzcOP6+E6ZS5Q
   s=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.15,191,1739833200"; 
   d="scan'208";a="113531443"
Received: from unknown (HELO hadrien) ([50.225.219.62])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Apr 2025 15:30:31 +0200
Date: Sat, 5 Apr 2025 09:30:29 -0400 (EDT)
From: Julia Lawall <julia.lawall@inria.fr>
To: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, outreachy@lists.linux.dev, 
    linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5] staging: rtl8723bs: Prevent duplicate NULL tests on
 a value
In-Reply-To: <Z/EuZuvGyQ9QBl6z@HP-650>
Message-ID: <7e94b75e-6959-75c-ab4f-58147fc37dc@inria.fr>
References: <Z/EuZuvGyQ9QBl6z@HP-650>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Sat, 5 Apr 2025, Abraham Samuel Adekunle wrote:

> When a value has been tested for NULL in an expression, a
> second NULL test on the same value in another expression
> is unnecessary when the value has not been assigned to NULL.
>
> Remove unnecessary duplicate NULL tests on the same value
> that has previously been tested.
>
> Found by Coccinelle.

The changes are found in the same way, but the code patterns are overall
quite different.  It could make sense to make separate patches for them.
Then you could make a log message that is really specialized to the code
in each patch and it would be easier for the reviewer to be convinced that
you have done the right thing.

julia

>
> Signed-off-by: Abraham Samuel Adekunle <abrahamadekunle50@gmail.com>
> ---
> Changed in v4:
> 	- Separated initially integrated suggested change
> 	 "use modulo % 4096 over & 0xfff" to a different patch.
> Changes in v3:
> 	- Changed other cases to use modulo (% 4096) over (& 0xofff).
> 	- Modified commit message to reflect these changes.
> Changes in v2:
> 	- Dropped patch files for media drivers from patchset as it is
> 	  not meant for outreachy applicants.
> 	- Added full-stop aign to text in commit message.
> 	- Made code more readable by adding a line break.
> 	- Changed cases to use modulo (% 4096) over (& 0xfff).
> Changes in v1
> 	- Patch for drivers/staging/media/av7110/sp8870.c and
> 	- drivers/staging/media/atomisp/pci/atomisp_gmin_platform.c
> 	  is split into two different patches in the patchset for use by the different
> 	  driver maintainers.
> 	- Added subject title for each of the separated patches.
> 	- Patch 1: Removed unnecessary curly braces {} initially inserted.
> 	- Patch 2: Unnecessary {} was also removed for v1.
>
>  drivers/staging/rtl8723bs/core/rtw_mlme_ext.c |  2 +-
>  drivers/staging/rtl8723bs/core/rtw_xmit.c     | 56 +++++++++----------
>  2 files changed, 28 insertions(+), 30 deletions(-)
>
> diff --git a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> index 90966b7034ab..675226535cd1 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_mlme_ext.c
> @@ -1323,7 +1323,7 @@ unsigned int OnAssocReq(struct adapter *padapter, union recv_frame *precv_frame)
>  	spin_unlock_bh(&pstapriv->asoc_list_lock);
>
>  	/*  now the station is qualified to join our BSS... */
> -	if (pstat && (pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
> +	if ((pstat->state & WIFI_FW_ASSOC_SUCCESS) && (status == WLAN_STATUS_SUCCESS)) {
>  		/* 1 bss_cap_update & sta_info_update */
>  		bss_cap_update_on_sta_join(padapter, pstat);
>  		sta_info_update(padapter, pstat);
> diff --git a/drivers/staging/rtl8723bs/core/rtw_xmit.c b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> index 026061b464f7..f817cab2f831 100644
> --- a/drivers/staging/rtl8723bs/core/rtw_xmit.c
> +++ b/drivers/staging/rtl8723bs/core/rtw_xmit.c
> @@ -941,35 +941,33 @@ s32 rtw_make_wlanhdr(struct adapter *padapter, u8 *hdr, struct pkt_attrib *pattr
>  			if (!(psta->state & _FW_LINKED))
>  				return _FAIL;
>
> -			if (psta) {
> -				psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
> -				psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> -				pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
> -
> -				SetSeqNum(hdr, pattrib->seqnum);
> -
> -				/* check if enable ampdu */
> -				if (pattrib->ht_en && psta->htpriv.ampdu_enable)
> -					if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
> -						pattrib->ampdu_en = true;
> -
> -				/* re-check if enable ampdu by BA_starting_seqctrl */
> -				if (pattrib->ampdu_en == true) {
> -					u16 tx_seq;
> -
> -					tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
> -
> -					/* check BA_starting_seqctrl */
> -					if (SN_LESS(pattrib->seqnum, tx_seq)) {
> -						pattrib->ampdu_en = false;/* AGG BK */
> -					} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> -
> -						pattrib->ampdu_en = true;/* AGG EN */
> -					} else {
> -						psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
> -						pattrib->ampdu_en = true;/* AGG EN */
> -					}
> +			psta->sta_xmitpriv.txseq_tid[pattrib->priority]++;
> +			psta->sta_xmitpriv.txseq_tid[pattrib->priority] &= 0xFFF;
> +			pattrib->seqnum = psta->sta_xmitpriv.txseq_tid[pattrib->priority];
> +
> +			SetSeqNum(hdr, pattrib->seqnum);
> +
> +			/* check if enable ampdu */
> +			if (pattrib->ht_en && psta->htpriv.ampdu_enable)
> +				if (psta->htpriv.agg_enable_bitmap & BIT(pattrib->priority))
> +					pattrib->ampdu_en = true;
> +
> +			/* re-check if enable ampdu by BA_starting_seqctrl */
> +			if (pattrib->ampdu_en == true) {
> +				u16 tx_seq;
> +
> +				tx_seq = psta->BA_starting_seqctrl[pattrib->priority & 0x0f];
> +
> +				/* check BA_starting_seqctrl */
> +				if (SN_LESS(pattrib->seqnum, tx_seq)) {
> +					pattrib->ampdu_en = false;/* AGG BK */
> +				} else if (SN_EQUAL(pattrib->seqnum, tx_seq)) {
> +					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (tx_seq+1)&0xfff;
> +
> +					pattrib->ampdu_en = true;/* AGG EN */
> +				} else {
> +					psta->BA_starting_seqctrl[pattrib->priority & 0x0f] = (pattrib->seqnum+1)&0xfff;
> +					pattrib->ampdu_en = true;/* AGG EN */
>  				}
>  			}
>  		}
> --
> 2.34.1
>
>
