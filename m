Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45CE3272E48
	for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 11:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747740290; cv=none; b=pGCxfk7MXmPS4xGyBIWrybTR98o/ethod7RtY4aNXdqlWL8BW7DO0EiKfM4nIDBLGoPx3rzq6F4afalmyssExRpfShOE+S4tZ1xxN3SbPCIDan5fslDbdIDNFdPGseXiPH6Az2gwyYfqqGsihRkB3QV0t/AIUTShM/K7rRqggvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747740290; c=relaxed/simple;
	bh=TuAIH9bfwGkhs90AUwbat8H9o+RJq1imxYa/lL35UsQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cfEYYPeA0mtbdJGn1k3PJj98F0FONvJ/GzPzZjxzDyaUv7/z6JBYWvafmfGoJnqpnayC2ZimF65e2u1L4sXkYkzRLsd4cTbgth5Hucx9erefo5UmDfZqWZ39J5Q+vL5VcKdImdC0tQv44phMvMsQR3qh5jCvGwC/JMQuqGfZ3Z4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=elDCBclS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="elDCBclS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1747740288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=fe9XgeFRrKR14t48Y5t/+VDl1Nkl0xKTWni0QoyTko0=;
	b=elDCBclSAR6qvQlWcRE9E1wXas1PC4ReG1izfRpYwvxA4/Iw5Mdzmqcz4ViOrPMr3PuhyB
	ZzwJEfkPDJcyAzfgolvm3ATWd+EXGG9cN02W1IKXlc69wLbXlo3HbfGFxtgiT2kfxg/msu
	yCS0jGMmUUaidY6HhlKKJufa/GD/yqA=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-180-B_UnSwcxMPWCWyPJREb1dA-1; Tue, 20 May 2025 07:24:46 -0400
X-MC-Unique: B_UnSwcxMPWCWyPJREb1dA-1
X-Mimecast-MFC-AGG-ID: B_UnSwcxMPWCWyPJREb1dA_1747740285
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-3a364394fa8so1702406f8f.0
        for <linux-kernel@vger.kernel.org>; Tue, 20 May 2025 04:24:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747740285; x=1748345085;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fe9XgeFRrKR14t48Y5t/+VDl1Nkl0xKTWni0QoyTko0=;
        b=negvtjHJw8Eh6FW7VL034nXM0dJ+44CXeUYRQKWpRYblVJ8WCW4WKeA4hev2m+/Eof
         ArtequkA53CNkHK/OzXs8RofisjXgddC4Ks5zfHVGH8Pqjc8877T/D12rL1XUjMKXFrq
         /ZneNLWW24UpGUvUbLOSlCAH06RF5Zr6qKCgBkWKhZjhKMGBVKZ/bfk1biiOuaxuEGHk
         g5EF3mPGIPR0ri4568Cv1lP9Dm8l8UBu4PTSH+kbGdc5GiAzbdOEp0Fkw1ThR19NSitA
         tSONQJP81hAhO54/Ubw0XtfawGUiSgMaviyjZF39qaG4vRfYMMnaO3g7KG9YvyNqEcaA
         Rv8A==
X-Forwarded-Encrypted: i=1; AJvYcCVuKeejuoCoI7BAo78liCs/U2/Vq/dCDSXc7mf6hZYG5AfUaudWN5sjPOVGApD9OT6MsCedq6knp98qBYY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzsO9oLAgnbktZLbQSJxmynQGh47hXnONO44RQoylw9ajH5ScKn
	vJNmRX27B/jOiBdURI3G4aZztBIIyjFRkyZrkcM49p8mnWChNy7m017s2FZ2cawmXWXIYaEIjYp
	IfEZcFWhgvLj9vY7LDhN0f2DjMhJTWA7ZCswq9z6QYO14vFjaZUA0ml/7xey8DLDFIw==
X-Gm-Gg: ASbGnctM+hxhi6XU234BGYWfVNpOuAAsTeJGBeRRL8oohS0ghq2AhKuEwDpHmpjQPuK
	jCl1naYo0RyVr1H4ROhxb+9SpcIXmPT5wYMBjRTXYNlAw5eTJ1a2F6akI4Qq49zqhJkoxTC/+9F
	YdzO1fxsg8D9YfgF4Vvut95pqFIikJuFMHDwqSoo2RAzhoTgOrnj75HLTEUqozg4QKQOwZxiA0T
	UYyx0Ni7kmsyH0pLX+lH52oSCUdQwXfhPw1nJUh60z5yTvfj+FUbu7oFygqjOvjQCZa9Taze7Eq
	CMiVirDAbdJJm/z8U4U=
X-Received: by 2002:a05:6000:2304:b0:3a0:b521:9525 with SMTP id ffacd0b85a97d-3a35fe65fb8mr12718950f8f.1.1747740285491;
        Tue, 20 May 2025 04:24:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEofFs1HXEriOPCetmLcj952oc2+OEDOvFvT2d4euNrXMvEB2EHBEoF9oG/uDbOigZv9W8Xdg==
X-Received: by 2002:a05:6000:2304:b0:3a0:b521:9525 with SMTP id ffacd0b85a97d-3a35fe65fb8mr12718940f8f.1.1747740285150;
        Tue, 20 May 2025 04:24:45 -0700 (PDT)
Received: from ?IPV6:2a0d:3344:244f:5710::f39? ([2a0d:3344:244f:5710::f39])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a35ca6254bsm16428674f8f.52.2025.05.20.04.24.43
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 May 2025 04:24:44 -0700 (PDT)
Message-ID: <0d3a3a42-4141-4c4d-b25a-3c9181d5842e@redhat.com>
Date: Tue, 20 May 2025 13:24:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v7] selftests/vsock: add initial vmtest.sh for
 vsock
To: Bobby Eshleman <bobbyeshleman@gmail.com>,
 Stefano Garzarella <sgarzare@redhat.com>,
 Stefan Hajnoczi <stefanha@redhat.com>, Shuah Khan <shuah@kernel.org>
Cc: kvm@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, linux-kernel@vger.kernel.org,
 virtualization@lists.linux.dev, netdev@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20250515-vsock-vmtest-v7-1-ba6fa86d6c2c@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20250515-vsock-vmtest-v7-1-ba6fa86d6c2c@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/16/25 12:00 AM, Bobby Eshleman wrote:
> +tap_prefix() {
> +	sed -e "s/^/${TAP_PREFIX}/"
> +}

I think there is no need to the tap prefix to the output you intend to
'comment out', the kselftest infra should already add the tap prefix
mark to each line generated by the test,

> +
> +tap_output() {
> +	if [[ ! -z "$TAP_PREFIX" ]]; then

AFAICS TAP_PREFIX is a not empty string constant, so this function is
always a no op. If so it should be dropped.

Otherwise LGTM, thanks,

Paolo

