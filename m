Received: from e2i655.smtp2go.com (e2i655.smtp2go.com [103.2.142.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C9B278E40
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 10:13:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744366405; cv=none; b=XkPWzIrxUT2qomGQoWUNadp0rOmPOC1kYgX409KlkxRz6j+uFtSgnrZyFJjtzUHRcQGp37hlGSkkfL6xK18WI2KvGVm7IFjnKfdVCPTjHO/sBhyjnzjrE39r2XnYyrj9iy1hS5t1j776H/S0KeWQ7ZLfMH4f4XT/QNJ4X56CvCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744366405; c=relaxed/simple;
	bh=PWNSQc6TOmToyxJPxRmIfaUxC8jmVIYtwGAloEpfCXo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oGsbHRJeKMD/N3gaJBwMKMG/FYjsb5gWNvVaHlzPtwrX4ix38odXHAtDR2zaputACZDnH7KyR/ekfPzr6/XEmBh6lmD30cvyZh+9MuJffTFDKTT0TycXHkfh/+d8ly0cVtxcpyq4L+yP2oW+wqWa/+DsPWYVHflH2GewDBaGT00=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt; spf=pass smtp.mailfrom=em510616.triplefau.lt; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=a5hLY7PK reason="unknown key version"; dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b=MGxNEZuc; arc=none smtp.client-ip=103.2.142.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em510616.triplefau.lt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="a5hLY7PK";
	dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b="MGxNEZuc"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1744367298; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=FT6H7ZVT7qjT0tHeNL6ZfiwPZh7QsXu9tJmoUMdPOTM=; b=a5hLY7PKiNGOp42dOknLsRyZeW
	AyMCxN9abwjAPxmXjYWz8+rztARhO9gbSXjdzPtOCGzZ93YzMSIFu4aNJ5AcDfPJi2mQQlp8rCw6U
	TQyIK1nE7EiSO6zKD4iCKCwjyGYVx2zATeP0cbKubbNvliBJBPD6AdHtzlQPq14j0EG3pdL5AQIy8
	X/B/4N+tnsBMDlXnRrqV9T+0A4H9rENAbKxw4j79Po2f2S8Te/ROoJ5gSKYWMtfd0YpoTfSgf/17c
	uuOX8Lew6LGlBCEugAM9+NJ04E+LpTDMysYT9A9AYnxI0Xawrou33aqXeMoxlDv3Q2XnLJKOW0nwe
	H+3vKBtw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1744366398; h=from : subject
 : to : message-id : date;
 bh=FT6H7ZVT7qjT0tHeNL6ZfiwPZh7QsXu9tJmoUMdPOTM=;
 b=MGxNEZucKAhmx8kXTyYFYpsMdKnAiV8yQWghJ0mmoYM8PG1CdJNo8CH6JhIdBnmxi1f5p
 JA/301RZnBhK41qbNpJ4nliItkxpvuIycDwbAkfVefH62VxNo38KN7a8IuOMASyTn2Fe9i6
 aOB5tU0IR6LfMpURbrJHcOeYYXYoGJ7mO5/zdrZCab7r8p/jL6ewBJnvr4wrF4Vr8S669XA
 widBuJUgTrAUJEAjjYfqG6RrLpI5wfezGpgmEANgV3cqNcjI43DTZCh6DWofNBOjiQGBHuv
 8b3TEqzrti5VKUUGO+r+p3loetyafQyGrI0CMQn9Pp2LNBcnNGEiHG5QQucg==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1u3BNh-qt4DyW-Nr; Fri, 11 Apr 2025 10:13:05 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1u3BNh-4o5NDgrpqqr-lFwP; Fri, 11 Apr 2025 10:13:05 +0000
Date: Fri, 11 Apr 2025 12:06:35 +0200
From: Remi Pommarel <repk@triplefau.lt>
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 johannes@sipsolutions.net
Subject: Re: [PATCH wireless v2 1/2] wifi: mac80211: Update skb's control
 block key in ieee80211_tx_dequeue()
Message-ID: <Z_jpq26P99qzPP1c@pilgrim>
References: <06aa507b853ca385ceded81c18b0a6dd0f081bc8.1742833382.git.repk@triplefau.lt>
 <20250410215527.3001-1-spasswolf@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410215527.3001-1-spasswolf@web.de>
X-Smtpcorp-Track: 3s3BhFMJKlhI.zNYnkfmoOy1Y.bIeJSQxb6lH
Feedback-ID: 510616m:510616apGKSTK:510616sBGiWowcYh
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

Hi Bert,

On Thu, Apr 10, 2025 at 11:55:26PM +0200, Bert Karwatzki wrote:
> This commit breaks the mediatek mt7921 wireless driver. In linux-next-20250410
> my mt7921e Wi-Fi controller is no longer able to connect to a network.
> I bisected this to commit a104042e2bf6 ("wifi: mac80211: Update skb's control
> block key in ieee80211_tx_dequeue()").
> 
> Hardware:
> 04:00.0 Network controller: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E 80MHz
> 
> This debugging patch reveals that the change causes key to be NULL in
> mt7921_tx_prepare_skb().
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> index 881812ba03ff..3b8552a1055c 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> @@ -13,6 +13,7 @@ int mt7921e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
>         struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
>         struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
>         struct ieee80211_key_conf *key = info->control.hw_key;
> +       dev_info(mdev->dev, "%s: key = %px\n", __func__, key);
>         struct mt76_connac_hw_txp *txp;
>         struct mt76_txwi_cache *t;
>         int id, pid;
> 
> 
> So why is info->control.hw_key not updated by ieee80211_tx_h_select_key()?
> 
> diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
> index 34f229a6eab0..2510e3533d13 100644
> --- a/net/mac80211/tx.c
> +++ b/net/mac80211/tx.c
> @@ -631,8 +631,10 @@ ieee80211_tx_h_select_key(struct ieee80211_tx_data *tx)
>  		case WLAN_CIPHER_SUITE_WEP40:
>  		case WLAN_CIPHER_SUITE_WEP104:
>  		case WLAN_CIPHER_SUITE_TKIP:
> -			if (!ieee80211_is_data_present(hdr->frame_control))
> +			if (!ieee80211_is_data_present(hdr->frame_control)) {
> +				printk(KERN_INFO "%s %d: setting tx->key = NULL\n", __func__, __LINE__);
>  				tx->key = NULL;
> +			}
>  			break;
>  		case WLAN_CIPHER_SUITE_CCMP:
>  		case WLAN_CIPHER_SUITE_CCMP_256:
> @@ -641,19 +643,23 @@ ieee80211_tx_h_select_key(struct ieee80211_tx_data *tx)
>  			if (!ieee80211_is_data_present(hdr->frame_control) &&
>  			    !ieee80211_use_mfp(hdr->frame_control, tx->sta,
>  					       tx->skb) &&
> -			    !ieee80211_is_group_privacy_action(tx->skb))
> +			    !ieee80211_is_group_privacy_action(tx->skb)) {
> +				printk(KERN_INFO "%s %d: setting tx->key = NULL\n", __func__, __LINE__);
>  				tx->key = NULL;
> -			else
> +			} else {
>  				skip_hw = (tx->key->conf.flags &
>  					   IEEE80211_KEY_FLAG_SW_MGMT_TX) &&
>  					ieee80211_is_mgmt(hdr->frame_control);
> +			}
>  			break;
>  		case WLAN_CIPHER_SUITE_AES_CMAC:
>  		case WLAN_CIPHER_SUITE_BIP_CMAC_256:
>  		case WLAN_CIPHER_SUITE_BIP_GMAC_128:
>  		case WLAN_CIPHER_SUITE_BIP_GMAC_256:
> -			if (!ieee80211_is_mgmt(hdr->frame_control))
> +			if (!ieee80211_is_mgmt(hdr->frame_control)) {
> +				printk(KERN_INFO "%s %d: setting tx->key = NULL\n", __func__, __LINE__);
>  				tx->key = NULL;
> +			}
>  			break;
>  		}
> 
> @@ -662,9 +668,13 @@ ieee80211_tx_h_select_key(struct ieee80211_tx_data *tx)
>  			     tx->skb->protocol != tx->sdata->control_port_protocol)
>  			return TX_DROP;
> 
> +		printk(KERN_INFO "%s: skip_hw=%d tx->key=%px\n",
> +				__func__, skip_hw, tx->key);
>  		if (!skip_hw && tx->key &&
> -		    tx->key->flags & KEY_FLAG_UPLOADED_TO_HARDWARE)
> +		    tx->key->flags & KEY_FLAG_UPLOADED_TO_HARDWARE) {
>  			info->control.hw_key = &tx->key->conf;
> +			printk(KERN_INFO "%s: info->control.hw_key = %px\n", __func__, info->control.hw_key);
> +		}
>  	} else if (ieee80211_is_data_present(hdr->frame_control) && tx->sta &&
>  		   test_sta_flag(tx->sta, WLAN_STA_USES_ENCRYPTION)) {
>  		return TX_DROP;
> @@ -3894,6 +3904,8 @@ struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
>  	 * The key can be removed while the packet was queued, so need to call
>  	 * this here to get the current key.
>  	 */
> +	printk(KERN_INFO "%s: info->control.hw_key = %px, setting to NULL\n",
> +			__func__, info->control.hw_key);
>  	info->control.hw_key = NULL;
>  	r = ieee80211_tx_h_select_key(&tx);
>  	if (r != TX_CONTINUE) {
> 
> This patch reveals that tx->key is set to NULL (in the @@ -641,19 +643,23 @@ chunk)
> and so the updating of info->contro.hw_key is skipped:
> 
> [   17.411298] [   T1232] ieee80211_tx_h_select_key 647: setting tx->key = NULL

That means that we are trying to send non management frames using
AES_CMAC, or BIP_* cipher, aren't those ciphers used only for group
management frames ?

> [   17.411300] [   T1232] ieee80211_tx_h_select_key: skip_hw=0 tx->key=0000000000000000
> [   17.411307] [   T1232] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key = 0000000000000000
> 
> If I revert commit a104042e2bf6 while keeping the debug patches it shows that
> the for mt7921e the key is never updated in ieee80211_tx_h_select_key(), mt7921e
> relies on the key your patch is setting to NULL.
> 
> Is this a problem with your patch or with the mt7921e driver that just got
> revealed by your patch?

Not sure yet, do you happen to know which kind of frame mt7921e is
trying to be sent using this NULL key ?

Thanks,

-- 
Remi
