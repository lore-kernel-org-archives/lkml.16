Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com [209.85.167.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59CB2D1F61
	for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 19:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749756830; cv=none; b=VbN6MM4u+2ipkbXXpoMtNjwV4k+NOE31ZEZyqlAJhUsMaZZplfjvxXpP6conWp+pEQxyEF8Dn5EMVPHLUXCYB6RAySaWYrQR0r99PPedfZ5X0XjoPFS4HVhF+n3w8lRpNldVx00wOk+M8SyB5Xuznz2PzL0rZnd2czmciX9nLJc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749756830; c=relaxed/simple;
	bh=tHNKtJGZojCVgfiRCe2QQAOxiXNgWesrIsBW6OU1mYo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DBkETWyj9Akfnp70v/AQHsD8YzScGOqIXMbTzu2b/7mWtSDvYrHU8/KY3J0Sm4JG5I+9ezkfwBilJrpVMeNZzypVfSxT5YAjhB6NxvXBTeXgvhRalTWmwVz55eD44/RdkT8PCdKLYKvnnsUTYXjC06ymNea5zKP885kWjKcNWns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yU+cjZyz; arc=none smtp.client-ip=209.85.167.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yU+cjZyz"
Received: by mail-lf1-f52.google.com with SMTP id 2adb3069b0e04-551fdd1c4b3so131702e87.0
        for <linux-kernel@vger.kernel.org>; Thu, 12 Jun 2025 12:33:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1749756827; x=1750361627; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/RxPpRZAeOeEdln261y+O89TUnaxHjb/5Wo9Nm9MPBo=;
        b=yU+cjZyz/lDB57ZndIfQJdvE95Mqrt4Rid6SlewWb6JWQbtjl+1vt0FY7GZzaP3Nb8
         PS2pZFSVTpnIz6CjKVH2WZ+kMQtu1pshT4sBWe8d9w56k6Mo23hD6+R+x7pxuNMZPD1z
         cMaYN7+pzm5UYPksCH7uLjJrx2AwwsZrfzf9KHDQqa04KXSmgKz7r1sgcUQqZuFZwhcD
         /LbLWhL/ZeiNSmttpTu0auTtVEX+5kuPR6bRiYxGL2mYKe6DedNl1u19SbAF43XCj4zl
         7ctrugnc9VL3pCUWUsnZJmpurTpaL+oznsMGBw/uZ4VKRJsKmciwMnQh7BM7mDrTfvYL
         RfZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749756827; x=1750361627;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/RxPpRZAeOeEdln261y+O89TUnaxHjb/5Wo9Nm9MPBo=;
        b=PcBjnNRq1EIJM7Bv4mF9FmJsnAo0J5Qxg/5/3GiCveMN+3BoYG15GeepH2vHcnHGRf
         4VnV1D8VkY8WauF1qZhEK+Qu+pM28Z633noHjjXErc3RT7R2CDXJeECsiqVw0TlxiYoe
         5vzPXuCOwoC6CL4iH++DZlbnkLKcmUy8hhirbhL/BGrknKclzpYNzyjz7q+uzAsppZNL
         xMp2R+clFKxHppliEGop1kLP+GFj3TTPGgEQ2AupJsoWc5zK7ot/nbZFxxzpYcVJeJQ4
         dPCvdCbnWAQhG2dselXfxqhDOp5t2ZorhnG2rM7DKSvxK4KQzXxaTFaLS7iHba3b+zHn
         vB2w==
X-Forwarded-Encrypted: i=1; AJvYcCUkiyNjp1jlMDEMS4kx84Lrtyudhljjga4obdZWOPtQOsBeHj6vQtUDT9Y532imMIIUwv8FBCUTp9ly054=@vger.kernel.org
X-Gm-Message-State: AOJu0YyBv+I4SBkHXVPKbLckfnftEO2MSH2hklTn+U5ohBJicHbl9j9Q
	9UwMzUjIH0XDDOjoWPuknVJNSfiiUZYsuMcBFLCInOm/haUBOYHLRkH2kHiV22DNres=
X-Gm-Gg: ASbGncv2DVT44Sa33A6haMd4Cjl3ah9AwEvsJLLiKjF5J8dAdYPk6LMFOZErzLrb5DG
	RT5s1FY7QSqZp+kJihFO13T/g+i6N5wNJ6idhd05GofifcaYiJbCbcS035XyyIDVUTDtjjbaS4b
	qt/TZtQIpusCjc+yj8p1BlK5niXExFjqINNTgfSZYHTiAJh2RsLw/CInr+RXeJrjU1ItmRUbcB6
	JFxxSbt5X2K6+lll+XMAfuuNDOd+61jO2XhuawGcIgdlv36tPBWtaq0dMx/8Ru3u1utCQ54wl/U
	QgNcgql8vOaZ/g/uu/YTVdaCk0KxxFsuvNcrwG9SxFob8mGHm5ooU0iSfAIO3FMrQ/fHa2T1YMb
	1KTDDJoSt1aIcdWhZjBtRmA==
X-Google-Smtp-Source: AGHT+IHQD/Oxp/xYFAVT+SeSQ3hxs65KexX868fUYdr9i0VayB1JjyQaBIHqK89BIcXGncJ6LOCqew==
X-Received: by 2002:a05:6512:3da6:b0:553:647a:e47a with SMTP id 2adb3069b0e04-553af9a101fmr27172e87.14.1749756826958;
        Thu, 12 Jun 2025 12:33:46 -0700 (PDT)
Received: from localhost (c-85-229-7-191.bbcust.telenor.se. [85.229.7.191])
        by smtp.gmail.com with UTF8SMTPSA id 2adb3069b0e04-553ac1dbcd2sm199883e87.183.2025.06.12.12.33.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Jun 2025 12:33:45 -0700 (PDT)
Date: Thu, 12 Jun 2025 21:33:44 +0200
From: Anders Roxell <anders.roxell@linaro.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: miriam.rachel.korenblit@intel.com, dan.carpenter@linaro.org,
	arnd@arndb.de, linux-wireless@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Linux Kernel Functional Testing <lkft@linaro.org>
Subject: Re: [PATCH] wifi: iwlwifi: pcie: ensure RX_QUEUE_CB_SIZE fits
 bitfield for gcc-8|9
Message-ID: <aEsrmH7sDVvsmgLs@monster>
References: <20250612130719.3878754-1-anders.roxell@linaro.org>
 <d2ea3f77ea2737aafc879f4fc291dee097867b61.camel@sipsolutions.net>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d2ea3f77ea2737aafc879f4fc291dee097867b61.camel@sipsolutions.net>

On 2025-06-12 17:21, Johannes Berg wrote:
> > 
> > diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c b/drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c
> > index cb36baac14da..1854d071aff2 100644
> > --- a/drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c
> > +++ b/drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c
> > @@ -204,9 +204,10 @@ int iwl_pcie_ctxt_info_init(struct iwl_trans *trans,
> >  
> >  	WARN_ON(RX_QUEUE_CB_SIZE(iwl_trans_get_num_rbds(trans)) > 12);
> >  	control_flags = IWL_CTXT_INFO_TFD_FORMAT_LONG;
> > -	control_flags |=
> > -		u32_encode_bits(RX_QUEUE_CB_SIZE(iwl_trans_get_num_rbds(trans)),
> > -				IWL_CTXT_INFO_RB_CB_SIZE);
> > +	/* This should just be u32_encode_bits() but gcc-8 and gcc-9 fail to build */
> > +	control_flags |= FIELD_PREP(IWL_CTXT_INFO_RB_CB_SIZE,
> > +		RX_QUEUE_CB_SIZE(iwl_trans_get_num_rbds(trans)) &
> > +		FIELD_MAX(IWL_CTXT_INFO_RB_CB_SIZE));
> > 
> 
> The coding style is really confusing now though - what are arguments to
> the macro and all that.

Would it help if I indent like this?

diff --git a/drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c b/drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c
index cb36baac14da..5bb81ed7db79 100644
--- a/drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c
+++ b/drivers/net/wireless/intel/iwlwifi/pcie/ctxt-info.c
@@ -204,9 +204,10 @@ int iwl_pcie_ctxt_info_init(struct iwl_trans *trans,
 
 	WARN_ON(RX_QUEUE_CB_SIZE(iwl_trans_get_num_rbds(trans)) > 12);
 	control_flags = IWL_CTXT_INFO_TFD_FORMAT_LONG;
-	control_flags |=
-		u32_encode_bits(RX_QUEUE_CB_SIZE(iwl_trans_get_num_rbds(trans)),
-				IWL_CTXT_INFO_RB_CB_SIZE);
+	/* This should just be u32_encode_bits() but gcc-8 and gcc-9 fail to build */
+	control_flags |= FIELD_PREP(IWL_CTXT_INFO_RB_CB_SIZE,
+				    RX_QUEUE_CB_SIZE(iwl_trans_get_num_rbds(trans)) &
+				    FIELD_MAX(IWL_CTXT_INFO_RB_CB_SIZE));
 	control_flags |= u32_encode_bits(rb_size, IWL_CTXT_INFO_RB_SIZE);
 	ctxt_info->control.control_flags = cpu_to_le32(control_flags);
 

Cheers,
Anders
