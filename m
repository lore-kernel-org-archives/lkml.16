Received: from e2i655.smtp2go.com (e2i655.smtp2go.com [103.2.142.143])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF9EA29344B
	for <linux-kernel@vger.kernel.org>; Fri, 11 Apr 2025 12:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.2.142.143
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744374159; cv=none; b=MS5BjqoSLc1oT8dYSXkE83C6mBQ8splsfSTOYlvXm6+cJ85AHjWjrPMGpN862DrYcrk8SVRLYVYlrHUdGOc04r3p7fcUJxNSKjj+p7NxkNQq+/8XrwzhyjVE/9qD2o7u/frxvc+zulz87pzwoquaAV9WSYJBOADsj29JPjXkjB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744374159; c=relaxed/simple;
	bh=4XZoFAx7vXQkMiG23Iqmq8TBpT7grTupJyNFMs8q5jw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=utgkYKxEx6PZ58ZkCPeRSPoILj60b5TBgg1Y7grB44p8FLUAYRva/lOH07hZ6pYCi/sOAqNRI7CjkBeqOEqYCO41BZrK9F/I+/LJj01tuGYVdeh2zIIFJxWONp9Y0s3v+QxRwRSOWWNd9yhWCRGqyCaanqeIOTXIrpHlzULnrFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt; spf=pass smtp.mailfrom=em510616.triplefau.lt; dkim=fail (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b=Mfo0r6Vw reason="unknown key version"; dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b=CNh7Ittt; arc=none smtp.client-ip=103.2.142.143
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=triplefau.lt
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=em510616.triplefau.lt
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="unknown key version" (0-bit key) header.d=smtpservice.net header.i=@smtpservice.net header.b="Mfo0r6Vw";
	dkim=pass (2048-bit key) header.d=triplefau.lt header.i=@triplefau.lt header.b="CNh7Ittt"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=smtpservice.net; s=maxzs0.a1-4.dyn; x=1744375056; h=Feedback-ID:
	X-Smtpcorp-Track:Message-ID:Subject:To:From:Date:Reply-To:Sender:
	List-Unsubscribe:List-Unsubscribe-Post;
	bh=vLiTjAfO3VovUn3zVLLPrqMzdMiQpK1B1IVgeKroo3c=; b=Mfo0r6VwmvbZbdjAF/FH4MEBLn
	etmIGDDaaGLKnNgfDZYxPnO9tTSZoVr6dsGZ729ASokkadmHxhHVqnYPnbl19pdYLz+fKNcck66X4
	lMQSMWGxxmGzqfcLytHDmpAGwiznHtq9e5u6Ywr5uF8+KqEUxdJMDOWoTaAAT52ELMmPNxnUaCYD+
	/oWzOv0isrviQ2Po1rn954LVMwL5xxsZ/GrQNpmME6/Q34p9Lfu1GCY4ZI6XhToJZN40+GaEh8u6C
	xoofEbEq/fszAlFyq5A0JewHIjDuymL+R6eT9NuNwf4KN6tj5Maih67RkNBbMzxGbt61IWwIF47KV
	yxjg/IFw==;
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1744374156; h=from : subject
 : to : message-id : date;
 bh=vLiTjAfO3VovUn3zVLLPrqMzdMiQpK1B1IVgeKroo3c=;
 b=CNh7ItttydZ+KfWX6f38SVZB1371JyuO7ib56GQGMI6LqMdWy+k3MWB+klQiPBaAMqu7z
 FJtEEAxEb+fU59GLZObCojtygpdz0O6RIm2PZ0i+3LPmFB/Kca+NW/xZe9AGBbl1t6IJVuo
 3DQhmF5pqL3m1i2C7w2/CGbjgvVDtPXLmzG67H2MNtu90tnjZz0LY5geBSYQuPGL1ZdMFMU
 B37DlyieaRlQrYTIsCHYAVQOoHGlLUyM12TOTqU5vACQXD+O+Ru0g7h30fBvFZiUEKQXCSe
 ciJLHoj7x/w2x91AZwVtOFyIA4I4JhWt2/P1/MMB6jaWY1rzcZt4kWMuku1w==
Received: from [10.139.162.187] (helo=SmtpCorp) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.94.2-S2G) (envelope-from <repk@triplefau.lt>)
 id 1u3DOq-qt4G4P-GK; Fri, 11 Apr 2025 12:22:24 +0000
Received: from [10.12.239.196] (helo=localhost) by smtpcorp.com with esmtpsa
 (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
 (Exim 4.97.1-S2G) (envelope-from <repk@triplefau.lt>)
 id 1u3DOq-4o5NDgrtE4J-kMgP; Fri, 11 Apr 2025 12:22:24 +0000
Date: Fri, 11 Apr 2025 14:15:52 +0200
From: Remi Pommarel <repk@triplefau.lt>
To: Bert Karwatzki <spasswolf@web.de>
Cc: linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org,
 johannes@sipsolutions.net, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH wireless v2 1/2] wifi: mac80211: Update skb's control
 block key in ieee80211_tx_dequeue()
Message-ID: <Z_kH-AuYGGNb3R4t@pilgrim>
References: <06aa507b853ca385ceded81c18b0a6dd0f081bc8.1742833382.git.repk@triplefau.lt>
 <20250410215527.3001-1-spasswolf@web.de> <Z_jpq26P99qzPP1c@pilgrim>
 <1df3a3df19b77e3b8d1f71a3a93c61221ff46a6b.camel@web.de>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1df3a3df19b77e3b8d1f71a3a93c61221ff46a6b.camel@web.de>
X-Smtpcorp-Track: 7uZPDBzQIJ1X.fE7_UUuphb2C.imqlvQAR9CW
Feedback-ID: 510616m:510616apGKSTK:510616sBGiWowcYh
X-Report-Abuse: Please forward a copy of this message, including all headers,
 to <abuse-report@smtp2go.com>

On Fri, Apr 11, 2025 at 01:10:02PM +0200, Bert Karwatzki wrote:
> Am Freitag, dem 11.04.2025 um 12:06 +0200 schrieb Remi Pommarel:
> > Hi Bert,
> >
> > On Thu, Apr 10, 2025 at 11:55:26PM +0200, Bert Karwatzki wrote:
> > > This commit breaks the mediatek mt7921 wireless driver. In linux-next-20250410
> > > my mt7921e Wi-Fi controller is no longer able to connect to a network.
> > > I bisected this to commit a104042e2bf6 ("wifi: mac80211: Update skb's control
> > > block key in ieee80211_tx_dequeue()").
> > >
> > > Hardware:
> > > 04:00.0 Network controller: MEDIATEK Corp. MT7921K (RZ608) Wi-Fi 6E 80MHz
> > >
> > > This debugging patch reveals that the change causes key to be NULL in
> > > mt7921_tx_prepare_skb().
> > >
> > > diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> > > index 881812ba03ff..3b8552a1055c 100644
> > > --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> > > +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> > > @@ -13,6 +13,7 @@ int mt7921e_tx_prepare_skb(struct mt76_dev *mdev, void *txwi_ptr,
> > >         struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
> > >         struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
> > >         struct ieee80211_key_conf *key = info->control.hw_key;
> > > +       dev_info(mdev->dev, "%s: key = %px\n", __func__, key);
> > >         struct mt76_connac_hw_txp *txp;
> > >         struct mt76_txwi_cache *t;
> > >         int id, pid;
> > >
> > >
> > > So why is info->control.hw_key not updated by ieee80211_tx_h_select_key()?
> > >
> > > diff --git a/net/mac80211/tx.c b/net/mac80211/tx.c
> > > index 34f229a6eab0..2510e3533d13 100644
> > > --- a/net/mac80211/tx.c
> > > +++ b/net/mac80211/tx.c
> > > @@ -631,8 +631,10 @@ ieee80211_tx_h_select_key(struct ieee80211_tx_data *tx)
> > >  		case WLAN_CIPHER_SUITE_WEP40:
> > >  		case WLAN_CIPHER_SUITE_WEP104:
> > >  		case WLAN_CIPHER_SUITE_TKIP:
> > > -			if (!ieee80211_is_data_present(hdr->frame_control))
> > > +			if (!ieee80211_is_data_present(hdr->frame_control)) {
> > > +				printk(KERN_INFO "%s %d: setting tx->key = NULL\n", __func__, __LINE__);
> > >  				tx->key = NULL;
> > > +			}
> > >  			break;
> > >  		case WLAN_CIPHER_SUITE_CCMP:
> > >  		case WLAN_CIPHER_SUITE_CCMP_256:
> > > @@ -641,19 +643,23 @@ ieee80211_tx_h_select_key(struct ieee80211_tx_data *tx)
> > >  			if (!ieee80211_is_data_present(hdr->frame_control) &&
> > >  			    !ieee80211_use_mfp(hdr->frame_control, tx->sta,
> > >  					       tx->skb) &&
> > > -			    !ieee80211_is_group_privacy_action(tx->skb))
> > > +			    !ieee80211_is_group_privacy_action(tx->skb)) {
> > > +				printk(KERN_INFO "%s %d: setting tx->key = NULL\n", __func__, __LINE__);
> > >  				tx->key = NULL;
> > > -			else
> > > +			} else {
> > >  				skip_hw = (tx->key->conf.flags &
> > >  					   IEEE80211_KEY_FLAG_SW_MGMT_TX) &&
> > >  					ieee80211_is_mgmt(hdr->frame_control);
> > > +			}
> > >  			break;
> > >  		case WLAN_CIPHER_SUITE_AES_CMAC:
> > >  		case WLAN_CIPHER_SUITE_BIP_CMAC_256:
> > >  		case WLAN_CIPHER_SUITE_BIP_GMAC_128:
> > >  		case WLAN_CIPHER_SUITE_BIP_GMAC_256:
> > > -			if (!ieee80211_is_mgmt(hdr->frame_control))
> > > +			if (!ieee80211_is_mgmt(hdr->frame_control)) {
> > > +				printk(KERN_INFO "%s %d: setting tx->key = NULL\n", __func__, __LINE__);
> > >  				tx->key = NULL;
> > > +			}
> > >  			break;
> > >  		}
> > >
> > > @@ -662,9 +668,13 @@ ieee80211_tx_h_select_key(struct ieee80211_tx_data *tx)
> > >  			     tx->skb->protocol != tx->sdata->control_port_protocol)
> > >  			return TX_DROP;
> > >
> > > +		printk(KERN_INFO "%s: skip_hw=%d tx->key=%px\n",
> > > +				__func__, skip_hw, tx->key);
> > >  		if (!skip_hw && tx->key &&
> > > -		    tx->key->flags & KEY_FLAG_UPLOADED_TO_HARDWARE)
> > > +		    tx->key->flags & KEY_FLAG_UPLOADED_TO_HARDWARE) {
> > >  			info->control.hw_key = &tx->key->conf;
> > > +			printk(KERN_INFO "%s: info->control.hw_key = %px\n", __func__, info->control.hw_key);
> > > +		}
> > >  	} else if (ieee80211_is_data_present(hdr->frame_control) && tx->sta &&
> > >  		   test_sta_flag(tx->sta, WLAN_STA_USES_ENCRYPTION)) {
> > >  		return TX_DROP;
> > > @@ -3894,6 +3904,8 @@ struct sk_buff *ieee80211_tx_dequeue(struct ieee80211_hw *hw,
> > >  	 * The key can be removed while the packet was queued, so need to call
> > >  	 * this here to get the current key.
> > >  	 */
> > > +	printk(KERN_INFO "%s: info->control.hw_key = %px, setting to NULL\n",
> > > +			__func__, info->control.hw_key);
> > >  	info->control.hw_key = NULL;
> > >  	r = ieee80211_tx_h_select_key(&tx);
> > >  	if (r != TX_CONTINUE) {
> > >
> > > This patch reveals that tx->key is set to NULL (in the @@ -641,19 +643,23 @@ chunk)
> > > and so the updating of info->contro.hw_key is skipped:
> > >
> > > [   17.411298] [   T1232] ieee80211_tx_h_select_key 647: setting tx->key = NULL
> >
> > That means that we are trying to send non management frames using
> > AES_CMAC, or BIP_* cipher, aren't those ciphers used only for group
> > management frames ?

Thanks for the debug.

I completely miscalculated the line here sorry. In fact it means here
that mt7921e needs a key for null data frames or for non protected
management frames.

As a lot of your frame control dump does not make sense to me (e.g.
0xffff) maybe you could try to print the fc here at line 647. Just a
wild guess maybe mt7921e needs MT_TXD3_PROTECT_FRAME for NULL data
frames ?

> >
> > > [   17.411300] [   T1232] ieee80211_tx_h_select_key: skip_hw=0 tx->key=0000000000000000
> > > [   17.411307] [   T1232] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key = 0000000000000000
> > >
> > > If I revert commit a104042e2bf6 while keeping the debug patches it shows that
> > > the for mt7921e the key is never updated in ieee80211_tx_h_select_key(), mt7921e
> > > relies on the key your patch is setting to NULL.
> > >
> > > Is this a problem with your patch or with the mt7921e driver that just got
> > > revealed by your patch?
> >
> > Not sure yet, do you happen to know which kind of frame mt7921e is
> > trying to be sent using this NULL key ?
> >
> > Thanks,
> 
> I modified my debugging patch to print mgmt->frame_control, if needed I could
> also insert a nore complicated function printing out frame types using the
> ieee80211_is_*() functions:
> 
> diff --git a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> index 881812ba03ff..cfbe7e1e4713 100644
> --- a/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> +++ b/drivers/net/wireless/mediatek/mt76/mt7921/pci_mac.c
> @@ -13,6 +13,9 @@ int mt7921e_tx_prepare_skb(struct mt76_dev *mdev, void
> *txwi_ptr,
>         struct mt792x_dev *dev = container_of(mdev, struct mt792x_dev, mt76);
>         struct ieee80211_tx_info *info = IEEE80211_SKB_CB(tx_info->skb);
>         struct ieee80211_key_conf *key = info->control.hw_key;
> +       struct ieee80211_mgmt *mgmt = (void *)tx_info->skb->data;
> +       __le16 fc = mgmt->frame_control;
> +       dev_info(mdev->dev, "%s: key = %px fc = 0x%hx\n", __func__, key, fc);
>         struct mt76_connac_hw_txp *txp;
>         struct mt76_txwi_cache *t;
>         int id, pid;
> 
> and get this, while unsuccesfully trying to connect (also note that one time
> getting a key worked):
> 
> $ dmesg | grep prepare_skb
> [   11.775642] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0xb0
> [   11.800047] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0x0
> [   13.365330] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0xb0
> [   13.370257] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0x0
> [   16.468481] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0xb0
> [   16.472407] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0x0
> [   16.542017] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0x188
> [   16.549581] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0x188
> [   16.597120] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0xffff

Thanks again for taking time to debug that.
As said above some of those fc does not make sense to me as I am not
expected first two bits (Protocol version) to be non null.

> [   16.612263] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> 0000000000000000 fc = 0xd0
> 
> Here we actually go a key:
> [   16.614478] [   T1227] mt7921e 0000:04:00.0: mt7921e_tx_prepare_skb: key =
> ffff89c275297230 fc = 0x4188
> [...]

-- 
Remi
