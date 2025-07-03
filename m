Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246C2A2D;
	Thu,  3 Jul 2025 05:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751521686; cv=none; b=WgmYJ0j6QVnZA5lMlhqpQBSa2xLWevpr4ZyaMW1zi/0WCxy7MMxDdPMcJDI2eeikRMPDht2bMRiqrhAd+AtsUfQX2B5nrLFqEDynrkT01nagIU0oTAQjNgsvgIE5sJEhV1x6OGxw6c2kBT0cWd9AuY69ab/RGRz5fJ1/BlScF94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751521686; c=relaxed/simple;
	bh=0pOHzoDUKBgLqmzty3nLoi9W1UERKjcUaGWTlW6CliA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=ItYHyP3PlTxDafJSYZ7WFkwxewaw6kGobK9Dhns9sj/krCyPTuXtj3lLfq77HiQhRXLjVur8LB293WKmecB4OErETT0uMyExYQ2garR4P+qHv7eDqqCAB5AUaCoQlpqMUc1VJwwfMgLPN1Gz9f2mQzPNLdnAXyx+932xmhpngPw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U9kxmaMf; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U9kxmaMf"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-74af4af04fdso470647b3a.1;
        Wed, 02 Jul 2025 22:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751521684; x=1752126484; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YeYruVMYK/XmcCRF6hjaAR6fjVlqTY1aOB89sVe6CxM=;
        b=U9kxmaMf66YpDqvq7p8tkmL1p3b24Wn88I5oEYCFkiocQk2SpQ6D9jwf1TSCMOQScK
         n56ooNLNPzqhRuAbj3x1UTQAOEmOv6aV4cUKVFJq9G71y9YqirdKDt6CAMKowbOWEpdU
         v4AZBNPE3Mk3Wv/9lotkscp/cMB8cTnXrImPT4wib6tDfcieogYogPoanQW1IFYfEHnT
         6vmJathyVKuXdtBg3PdX8TxQjuoLN3kxA5+vSMueQYmWhIHD3pvWcD3iV4Y8IkPmwrnd
         Pz8XAPuuJAvwkfSTVFIiDlwzLgvVIuy/uCsk4VdD0XZt8eBju02HgTgXISV5bdSVaxSI
         3bIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751521684; x=1752126484;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YeYruVMYK/XmcCRF6hjaAR6fjVlqTY1aOB89sVe6CxM=;
        b=PE0MsNbLHo6NZMRn7qm/cjXYROloQRvAirTRfZqiZ8aIQ+wIa5XoljpC6JT3kJo2aM
         bUYf08kP0L7XUw9zNZbbjdvWLHkvdgAbf/GIr0nH+yaexXufwBgmJG9GStqQnGasVvXL
         9x5rb69jbk0/JEaeLqdxBigdHG0/sFM5jZEZZWF89UiP10YqcHO7HkBohIAJxnzU0UDL
         wSvhmft6iTrWIj8qAItG/yIZdMIVxftSLCl69T1ody68RqRFXa4lbzrGxzqGfu/110so
         oEB373dgRP9mNnscxaOfHyaTsD9xgFDivmHlCvLlixVZ3xKgT2YNAJndyQJsE+5ZLwoH
         pvtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVieiFVpUjAdVcakxZVrWdtomUzBSXjsls1C9Cv13pBptXMZC6PhdqXUD6598zGcD47Zi6v9mN1dq2MqgRQ@vger.kernel.org, AJvYcCXFqEtJ17fIJQkCQVGpI1T8Ng8vLUYPu3fy/Rl3gyDZtBD7t1bQkC+bwJORlvxFFDKZUUxq91GlKnE=@vger.kernel.org
X-Gm-Message-State: AOJu0YynmWcK7ZKTaFfnrB4V0BsmHnE4lxWMr2mkcS5o3FSX3rr/nhsc
	Vn9YKG4o/Pfyw37hNaWL998VqrhuL+/5t5hK1vo6CXEv6DOFNf6kYry3
X-Gm-Gg: ASbGncsrbrL2YGYkGHPxiVxP+om713k46RpZ2bjAeIguNmyN1XG/iKhViihbm6JlQQB
	4TzmhBD/53kbmPvp52Ve/qD1qSlsXo3RQZyl4Zxt0yA4r6ALp693rLflHvfNTVI5rb4iz9lDRhU
	vUkSHVTSafkJ9rZYzyf2rRzno0vZ3fXMU7iA2iZp946gEX6sF0geijwrceleC5B3ZvCnFioUgRR
	tCRt/Na8JGtgL1kCPztaOznq467oOUB66N6KOBkkqMD1Bn4pQnC0J/HFoP3tbWB8SxKWHRbYBwy
	ZCPw1UcIr0QmpmogEW77jbkKEs0O8oeVQuP5ZPrmGzvzF+QOPz3NjUlbbEg6Kggd4kt40v6B41v
	VgHJh
X-Google-Smtp-Source: AGHT+IGzWujgKVoWjBlqYZ+0zI92gP39/OA1qVCrrwqiRKtehsjAWU5JM71YcI8aFSEMGap/pfP2Ow==
X-Received: by 2002:a05:6a20:3ca3:b0:215:dacf:5746 with SMTP id adf61e73a8af0-22488c4e600mr1349805637.19.1751521684222;
        Wed, 02 Jul 2025 22:48:04 -0700 (PDT)
Received: from [192.168.0.150] ([103.124.138.155])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b34e301cd38sm14574169a12.17.2025.07.02.22.48.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Jul 2025 22:48:03 -0700 (PDT)
Message-ID: <70ef2227-55ac-482b-9bcc-df1fd847abd9@gmail.com>
Date: Thu, 3 Jul 2025 12:48:00 +0700
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] docs: document linked lists
To: Randy Dunlap <rdunlap@infradead.org>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250702-linked-list-docs-v2-1-e36532f4b638@collabora.com>
 <aGX30ATQaD2EjWwW@archie.me>
 <194f16f5-4e26-460f-ae4c-8a5f93088fae@infradead.org>
Content-Language: en-US
From: Bagas Sanjaya <bagasdotme@gmail.com>
In-Reply-To: <194f16f5-4e26-460f-ae4c-8a5f93088fae@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/3/25 11:16, Randy Dunlap wrote:
> 
> 
> On 7/2/25 8:24 PM, Bagas Sanjaya wrote:
>> On Wed, Jul 02, 2025 at 10:24:47PM +0200, Nicolas Frattaroli wrote:
>>> diff --git a/Documentation/core-api/list.rst b/Documentation/core-api/list.rst
>>> new file mode 100644
>>> index 0000000000000000000000000000000000000000..b0586056abb04d2bcc4518f7238ff9a94d3dd774
>>> --- /dev/null
>>> +++ b/Documentation/core-api/list.rst
>>> @@ -0,0 +1,847 @@
> 
> [snip]
> 
>>
>> The text LGTM, thanks!
>>
>> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
>>
> 
> Please see https://people.kernel.org/tglx/notes-about-netiquette,
> especially "Trim replies".
> 

I did quote the whole diff to provide review context...

-- 
An old man doll... just what I always wanted! - Clara
