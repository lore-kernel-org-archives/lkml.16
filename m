Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7542293C6C
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 18:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750790102; cv=none; b=AwLW32QVFM54Aew21BJecdchugLZr1bCaJJZLfZsUSpSVTknPseiw/vkUy/S0ycLceICS2Ui6W8VJRQoC5lJFTD5v4f/3Ipx4lVLNg+/CgeVe4Bx+3ka95RUG8OEe29xYGUAvLyKmoLRGMVOR13O+gwHRWg6QWAJHK8QGYZCdQk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750790102; c=relaxed/simple;
	bh=FyMtzf3UMG4zcdd6lXh07V5464nm4eugc84yG+n/pRQ=;
	h=From:Message-ID:Date:MIME-Version:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=ik9AGd5DDUe2eSXgareFPJV0m7GbTVVc3KbqvI21oAIAOHhVhMwHc6VJq7YGkULXxHW81WRbvDamRCJV+DuXkMPvXrVh9qmXyJ7t5I7d8kP+eCBRmps8BxA3kUmHJ0zLT7k9k2R7HASvb/I8m9JA3mLhiaKbZD8HE60LOfNneL4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info; spf=pass smtp.mailfrom=jacekk.info; dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b=fu+Ej2Gy; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jacekk.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jacekk.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jacekk.info header.i=@jacekk.info header.b="fu+Ej2Gy"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-60702d77c60so1509125a12.3
        for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=jacekk.info; s=g2024; t=1750790099; x=1751394899; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+oUXxIfYOVwST5bWKMo3Tg1ykdOeL3eZDAJJuwYSVG8=;
        b=fu+Ej2GyfG1mCcMIkbl4CkQJDRdh4Xikk5OGNOxsV/tJqK5fR28gxVO3xsw0O/wo0M
         bjZ4JBBS6I58aBTgskj92xHCDSmScniJ6rvpjkGrgWkTpzcZFc8iqUX1DfXQOOlXZYCn
         lJCYWel0EbpKyBe+g2Ggx7yfLZPmU8ZdnxfmKYq262U3/jg0EiQ3NBH5Xzu80xWqNlqZ
         GVNXNZAS3DkDh1VT7NTDplBPjCeGLxSzl2UNLSqNZq3bEvMZ50oTGEGO38jl9eCU3Xu+
         UqOfj8FV7SWgOTNUzMyn+qhFny4OHos89TQeA0FyA8KxzHofdQ5dCxQFRRtGJ13r2q6o
         f6Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750790099; x=1751394899;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:user-agent:mime-version:date:message-id:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+oUXxIfYOVwST5bWKMo3Tg1ykdOeL3eZDAJJuwYSVG8=;
        b=H7DbHYKiH9eEaFFv7vo2Etux3FAXZzajbV1lBg7MsUVOBg6+G9Biu79/YQE5gXvX3W
         e66iIo0bzMPbINYYGYglOgQJgmGy/hTsQ4xT1eBDqYHYLRdHPlPODS87lbQpGzW+cmz6
         lWH523BQkFUyT5Ora9hxcahpTsto06173DQAsoZVo7UkYdA/dCExvxYpL2V2uOX9erHy
         S8tXS/5Wx1OfByPdd88+2RVqZ4AxAr6fTF5bRMtVtbchZDx5QziRhwT7atXUA3HpwevX
         ayJU8k/lcCMgzXkX6tgvk24WQw/V2RptB1MVm03W6NDa6/4KAz8+a3eyLSFwVdBg/rbq
         aCtg==
X-Forwarded-Encrypted: i=1; AJvYcCXs2AbJl3rZ936WfhKOux9QRxh+vKDoNr1jYqigLRBWjW5NVNckmS3YuLDQAK42BUq1o4BKM8CwaCW2NTk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwW3432BOTeXZhZBeMb1GYzGcACspaT6mzj48jizUcUxMgC5p+e
	sw6axZuK7WRYww8E8ZZggKExgULUAqaVfaXNXjGPrS/Kb5P0hc2zdKqItuSCQbOTdw==
X-Gm-Gg: ASbGnctGCJXxY+R/mt0//j6IGlG3y4iCK2lu45ToyEIkh47V0YnlZ6xsjMAa9jMzKEj
	Nw5fmZyhQNldGDMB5ZMVq52WHoHdIQ9PG1FZ+6clN0N9xKMOxxGPi6rzryiiUxu51e4rCgHD0re
	5cK2Wf3VFbYzPeGHW2SpoSnnJyrEUoXqTkaRZm+h2cA/TtmGW+5SfBk9bZnyI++0twk2cyDF31I
	Bofh1IEq7kYI2j7LZzUC9e+6tyQBcW+RDK60Q8RQuidgWjHXwq+TJVU1kkqRj5gMj/YBHoUIZs2
	n8Ntl0MKx5lVdXnaKjJUf1nreAynytQPoZ8UhzCv9QixIndM5UBFFwMcQ7K0hxD251ntngURCQw
	=
X-Google-Smtp-Source: AGHT+IF2Q7EXG3dh+dQGTwWFowwLHHyt4QaH8eo9c5nwntSUh27oaezGZyQ+fWjE9kDMnfbTjUYneg==
X-Received: by 2002:a05:6402:1e91:b0:604:e440:1d0b with SMTP id 4fb4d7f45d1cf-60c46435e1amr762835a12.4.1750790098337;
        Tue, 24 Jun 2025 11:34:58 -0700 (PDT)
Received: from [192.168.0.114] ([91.196.212.106])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-60c2f1ae651sm1380305a12.28.2025.06.24.11.34.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Jun 2025 11:34:57 -0700 (PDT)
From: Jacek Kowalski <jacek@jacekk.info>
X-Google-Original-From: Jacek Kowalski <Jacek@jacekk.info>
Message-ID: <e4903c9f-6b84-4831-8530-40ff6e27a367@jacekk.info>
Date: Tue, 24 Jun 2025 20:34:56 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] e1000e: ignore factory-default checksum value on
 TGP platform
To: Vlad URSU <vlad@ursu.me>, Tony Nguyen <anthony.l.nguyen@intel.com>,
 Przemek Kitszel <przemyslaw.kitszel@intel.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>
Cc: intel-wired-lan@lists.osuosl.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <fe064a2c-31d6-4671-ba30-198d121782d0@jacekk.info>
 <b7856437-2c74-4e01-affa-3bbc57ce6c51@jacekk.info>
 <8538df94-8ce3-422d-a360-dd917c7e153a@jacekk.info>
 <431c1aaa-304d-4291-97f8-c092a6bee884@ursu.me>
Content-Language: en-US
In-Reply-To: <431c1aaa-304d-4291-97f8-c092a6bee884@ursu.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

> You are comparing the wrong value with NVM_SUM_FACTORY_DEFAULT. You 
> should check it against the checksum word 0x3F (NVM bytes 0x7E and
> 0x7F) which is used to ensure that the base NVM image is a valid
> image, and which in my case is left unchanged by Dell in the 
> firmware.

You are right that I'm comparing the wrong value. But it is only a 
matter of variable name:

-	if (hw->mac.type == e1000_pch_tgp && checksum ==
(u16)NVM_SUM_FACTORY_DEFAULT) {
+	if (hw->mac.type == e1000_pch_tgp && nvm_data ==
(u16)NVM_SUM_FACTORY_DEFAULT) {

Could you check my change with this modification?

-- 
Best regards,
   Jacek Kowalski
