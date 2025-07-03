Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 694A82E1747
	for <linux-kernel@vger.kernel.org>; Thu,  3 Jul 2025 10:50:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751539838; cv=none; b=qcrMedYeoQ7X1KM9mwoxMlsCHrdrplF66dIjHfycFj9R4Iw5dwyNtRf6fRweySi932MIxX4LnvJbMB6lLbE+tFeNPjL+OpX8aEGQ65wV8us8IC74AINhYo8ngplE/xtm0fog9PpAeiCFQHTWky/kS7OsQAkj5Eirt17CL/aN6K4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751539838; c=relaxed/simple;
	bh=hq2wU4Thxvj9W5q0QQZu8ghuyXx+360IX+pAXabRItI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HN5DRNfIUIbOjMz9m3HrjBY8fVKnuspHFG452qvhLj7iKgHop3gKT+ww2QE1mbUDiIImsPHTop5lCLIaMDuni8wP4/cjMYEsXrVAUKuNEQhsLTskc83zGbGd17DHxOp8voZajdQs1I4gH0CjFLmGjNzBqIxGLuFEqChCJYE9oTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=cCWoYLzX; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="cCWoYLzX"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1751539835;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hq2wU4Thxvj9W5q0QQZu8ghuyXx+360IX+pAXabRItI=;
	b=cCWoYLzXt3kQH6X9vDoaUPRmOmA+p3aR0oPtvHrBiUmxjAzwZlGXcgr0GM9OSpWTh5gri8
	GrdNFed14o1fMYpSdn2LwB5cZYlXM7SkXUHhsEvaRu70pLcNQPjd4DKjshRXXWvbeAfQo1
	sX9J/to0LNmYOWi6zXc8GLlmD+ToS6k=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-473-L5jMvvJ9ObC4URUrwHXPqg-1; Thu, 03 Jul 2025 06:50:32 -0400
X-MC-Unique: L5jMvvJ9ObC4URUrwHXPqg-1
X-Mimecast-MFC-AGG-ID: L5jMvvJ9ObC4URUrwHXPqg_1751539831
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-451ac1b43c4so39669735e9.0
        for <linux-kernel@vger.kernel.org>; Thu, 03 Jul 2025 03:50:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751539831; x=1752144631;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hq2wU4Thxvj9W5q0QQZu8ghuyXx+360IX+pAXabRItI=;
        b=SDbD6rkp0V8EjMHa5dbAKpG8YGVXukfX9Fq9nps/k+xYNs/Rp7NWa5f3zr50UJzF/y
         MOytv5HVcIZzNx1D6/zZ+iZtB68PUqMeg0p7wA6oqwpVz95rMYWpaiywd2dFRu/ePHBL
         ot4uEuvA+oqWGgLEHv0zZC8Svd2bKyERmxNSw88rjcBGVEmrq2PN2hNKJbFRCvh6KYAi
         XA5dA6a0WIU9p9kuyRiBjSIQ/GTGYgKVtjOqvNm3WpKwRmbRjX4Ud5KXhE+35sQ8V2Ro
         elZjbjClr4VQHiRWZE0/OKBj/EPX5uMMdtA1q11kyQbwln0VwvKIqEIJKHB7jqJFKWp7
         Fglw==
X-Forwarded-Encrypted: i=1; AJvYcCUOmTOBx859bwhKtf5FISBAZM/qqoQEZ/tPDRjKd8Ch/yevN0gt+/Po0yTCuYXERvLEzMrDPpynQ+sSy4Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YzLIdhC7InzGQ/1KllqCVILbZyZ+nxOoHxtFNVAMWLeKPvNf0V0
	AlKJ52vgOqlQo7EmFlDM/iBd4ge9o5+WOendTKYFFE1uFOJhkB46wvvtVPdNeCScl7eSrT90ocy
	ausNAgowaVy4uEd+7UZH5eYnbLQ0o+XkEhJTGzFWumYf+r4GnLUz8l09+U3meIc7K9A==
X-Gm-Gg: ASbGncu6IJ4N9tTOIGia3swPdXAFD5+fo7p+XAnDlrKm71/MRszBos8bfsyEZ/PX2Bj
	u4EAI/XKQ1vKCp71+teswuBqqdhzVYITYz0OTJUhuGiNiKt8iqcO/hiHX3+yanmSUaynksWbSM8
	b3fsrecZRq22FWwf5DLwHqufpbsHp9Cy/RgVTwhmoWSDgy5PDY8IJGdOAN8gotAMRbZ0cpnwmo7
	KOJOyggdk4ls8XKmAaH6y8nJaibbccOO4AhPbGDc83VQ1nFxyRZqQP0eWnQK6s7T1GeHZM/dRtg
	WnE0VqW2J9VmtL7ZAqmrG4la+D5m
X-Received: by 2002:a05:600c:8b77:b0:453:c39:d0a7 with SMTP id 5b1f17b1804b1-454a9c8b237mr29470985e9.5.1751539831107;
        Thu, 03 Jul 2025 03:50:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzDX+vbYuYqXz4dknV8AbAZbalPiUFcm+rHJ2WbwReCp9n7u2EYHmOh5K438umgtQEGSI9Og==
X-Received: by 2002:a05:600c:8b77:b0:453:c39:d0a7 with SMTP id 5b1f17b1804b1-454a9c8b237mr29470635e9.5.1751539830522;
        Thu, 03 Jul 2025 03:50:30 -0700 (PDT)
Received: from sgarzare-redhat ([193.207.161.238])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-454a997e24bsm23279805e9.16.2025.07.03.03.50.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Jul 2025 03:50:29 -0700 (PDT)
Date: Thu, 3 Jul 2025 12:50:21 +0200
From: Stefano Garzarella <sgarzare@redhat.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	HarshaVardhana S A <harshavardhana.sa@broadcom.com>, Bryan Tan <bryan-bt.tan@broadcom.com>, 
	Vishnu Dasa <vishnu.dasa@broadcom.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, 
	Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, virtualization@lists.linux.dev, 
	stable <stable@kernel.org>
Subject: Re: [PATCH net] vsock/vmci: Clear the vmci transport packet properly
 when initializing it
Message-ID: <756ms3h6ayqohczk3426xnzoby65luxzrbxblqvgl4ezlcqgph@xjz5m5qf5jew>
References: <20250701122254.2397440-1-gregkh@linuxfoundation.org>
 <37t6cnaqt2g7dyl6lauf7tccm5yzpv3dvxbngv7f7omiah35rr@nl35itdnhuda>
 <2025070144-brussels-revisit-9aa3@gregkh>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <2025070144-brussels-revisit-9aa3@gregkh>

On Tue, Jul 01, 2025 at 02:56:14PM +0200, Greg Kroah-Hartman wrote:
>On Tue, Jul 01, 2025 at 02:42:10PM +0200, Stefano Garzarella wrote:
>> On Tue, Jul 01, 2025 at 02:22:54PM +0200, Greg Kroah-Hartman wrote:
>> > From: HarshaVardhana S A <harshavardhana.sa@broadcom.com>
>> >
>> > In vmci_transport_packet_init memset the vmci_transport_packet before
>> > populating the fields to avoid any uninitialised data being left in the
>> > structure.
>>
>> Usually I would suggest inserting a Fixes tag, but if you didn't put it,
>> there's probably a reason :-)
>>
>> If we are going to add it, I think it should be:
>>
>> Fixes: d021c344051a ("VSOCK: Introduce VM Sockets")
>
>Yeah, I didn't think it was needed as this is obviously a "ever since
>this file has been there" type of thing, so it will be backported
>everywhere once it hits Linus's tree.

I see, thanks!
Stefano

