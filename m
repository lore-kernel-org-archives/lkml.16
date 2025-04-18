Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9F724E01F
	for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 10:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744971850; cv=none; b=DRqiC3FuHt6yMNjkdSE2SvmtnccuKzs7tw2sMyTl9l2Nd/d+w3oJBTcMbB7JBcoiJS/zDCMJpL5SdJDVdZNXpWnwwPQ+XrnwZW+EiKiL/6WwImidC1FhEHRe4tnrVPgSRDEWTDEaolihRdGdlicJFiV7VmaVF/vyZ038l/FIIlk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744971850; c=relaxed/simple;
	bh=atJhdaYKS6mysof7bXhlzakrTennjV1rb/oDep2wowk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Dc18RwzBBuHAuag9xe9W8AdPn4JYH6are6Pu9twadXmWttXbOFqFmANVhXavKJP68AovFg2vchbWITPv+/GwwxXq9oxtouhL2c1ywyjr6Qngo4TXiqLwDWkLgcdL2kkL8oInBlyWQF65+W0T9qgqMRoI7ey0IaTRtlqqGCHCXqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=G/1b13db; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="G/1b13db"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c0e0bc733so1626929f8f.1
        for <linux-kernel@vger.kernel.org>; Fri, 18 Apr 2025 03:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1744971846; x=1745576646; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=YJmTDwCr1kPva4b5vrqnHN2+KW5Z+MMvffJ+VbT6Gqg=;
        b=G/1b13dbFPQ3pVu2wAmR7BitESN2ySJU05KmD8gl/wGhLMAhtHgi4KGdyv6zJx0JmW
         67mZezflUT28zIgfZByxXwD5AfJF4w9A9maQIUKAa2Ml1kgozLHqicjpC2r+E51lEbUi
         sJLgYciLUqydjlo/Q1A6HT5vbaLt0vYNeBhSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744971846; x=1745576646;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YJmTDwCr1kPva4b5vrqnHN2+KW5Z+MMvffJ+VbT6Gqg=;
        b=fa1uPsW4POF4pm96TM9fhmQxm10L3dj2RCg/mEJc7u7B9GHtwHo9+tO7+DbKfdRHFP
         DwmBY9JiPo25zXFtqzE9XIcEfe9iQQvUIPMUDga9Z37oZUZFOGjsxax4puqO1f7O5RzO
         tABt6pYhrkM6fWw7Egdmqs8lo8Pi+NkDHrrmsE6jxvKpHpHCdsML8SXQbElecOQZkoSX
         HXsFjCH7HeJi0Y7ZLiqiXTdcoa9x103oD2UdTnAYFIlJ3WB+2VoE6MCRtwlbP+OHyhN3
         xKt8KSo2aAJr5m5iJuFY2o9k5y4uvvIoTXG82EuJXoeuP5HgH8CRrLhI4uC8PG7Sz6sY
         Z+Zg==
X-Forwarded-Encrypted: i=1; AJvYcCWiSo+NgrbSScNReHYARcVFJiCUNGm8OMXYIgJTx3N/k+ais4FTMDwRMOq/2+ZkRb9Aakh+s7pa5NmgaOo=@vger.kernel.org
X-Gm-Message-State: AOJu0YyO1BFI0I0bUi+3V4iO/jZbs8zuMRlOnHr+RYv9+p7tMjYuguPv
	oWPbJ9nhg68qbwUzXzVPqfUn/DpUTYrVhHFCgTxIJrHrK5kPzKiWW+AtTd38HZwkeF1yTZhqOhe
	psL8=
X-Gm-Gg: ASbGnctkHtyEcKxE7+8MvGeGfcBHnysFHrG9OAsB0Ja2hzTDLtl8yXO8UhZZr+PHpYU
	oIg5lbVQdwuvZSYnTRHuBP+gxDySlp74OtuMVOovwukoWkToLILWtFCbg+DKO+EWLPzZWq/4jY3
	Iy06a9eElOOrKphYQgWExmtUscojhz7pVP6JJj+pF9xlv/QEqkakWF+EGTh5D0Idha7J62mxJdw
	/c5ym/O+KrTfuMHlTVIRVlyTXRdXrZPoaAV4+e7TIiI56CyG9NLS0rnO6TSWkXIXHO586Bl+mz8
	L9yTPispaDzYsZUnniSC6EVXV4bTLWiLGq+ITwFIyV5FSY1CSh9S2bpBJIRpiI3+1JOpKxeQ4dI
	tJHP/fQ==
X-Google-Smtp-Source: AGHT+IHVvlOW/PQKztqdeuYLzZIIyWPEnxfP7TS8Tghjk3gRsyw5XUF1KlSks6byhbOqrb7JpJRwGA==
X-Received: by 2002:a05:6000:40de:b0:39e:e438:8e32 with SMTP id ffacd0b85a97d-39efbb09208mr1538497f8f.55.1744971845933;
        Fri, 18 Apr 2025 03:24:05 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-39efa420683sm2349158f8f.20.2025.04.18.03.24.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 18 Apr 2025 03:24:05 -0700 (PDT)
Message-ID: <50bf962c-2c9e-46a2-bbac-cba9cf229e79@citrix.com>
Date: Fri, 18 Apr 2025 11:24:04 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH -tip v2 1/2] x86/boot: Remove semicolon from "rep"
 prefixes
To: Uros Bizjak <ubizjak@gmail.com>, x86@kernel.org,
 linux-video@atrey.karlin.mff.cuni.cz, xen-devel@lists.xenproject.org,
 linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@kernel.org>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Martin Mares <mj@ucw.cz>
References: <20250418071437.4144391-1-ubizjak@gmail.com>
Content-Language: en-GB
From: Andrew Cooper <andrew.cooper3@citrix.com>
Autocrypt: addr=andrew.cooper3@citrix.com; keydata=
 xsFNBFLhNn8BEADVhE+Hb8i0GV6mihnnr/uiQQdPF8kUoFzCOPXkf7jQ5sLYeJa0cQi6Penp
 VtiFYznTairnVsN5J+ujSTIb+OlMSJUWV4opS7WVNnxHbFTPYZVQ3erv7NKc2iVizCRZ2Kxn
 srM1oPXWRic8BIAdYOKOloF2300SL/bIpeD+x7h3w9B/qez7nOin5NzkxgFoaUeIal12pXSR
 Q354FKFoy6Vh96gc4VRqte3jw8mPuJQpfws+Pb+swvSf/i1q1+1I4jsRQQh2m6OTADHIqg2E
 ofTYAEh7R5HfPx0EXoEDMdRjOeKn8+vvkAwhviWXTHlG3R1QkbE5M/oywnZ83udJmi+lxjJ5
 YhQ5IzomvJ16H0Bq+TLyVLO/VRksp1VR9HxCzItLNCS8PdpYYz5TC204ViycobYU65WMpzWe
 LFAGn8jSS25XIpqv0Y9k87dLbctKKA14Ifw2kq5OIVu2FuX+3i446JOa2vpCI9GcjCzi3oHV
 e00bzYiHMIl0FICrNJU0Kjho8pdo0m2uxkn6SYEpogAy9pnatUlO+erL4LqFUO7GXSdBRbw5
 gNt25XTLdSFuZtMxkY3tq8MFss5QnjhehCVPEpE6y9ZjI4XB8ad1G4oBHVGK5LMsvg22PfMJ
 ISWFSHoF/B5+lHkCKWkFxZ0gZn33ju5n6/FOdEx4B8cMJt+cWwARAQABzSlBbmRyZXcgQ29v
 cGVyIDxhbmRyZXcuY29vcGVyM0BjaXRyaXguY29tPsLBegQTAQgAJAIbAwULCQgHAwUVCgkI
 CwUWAgMBAAIeAQIXgAUCWKD95wIZAQAKCRBlw/kGpdefoHbdD/9AIoR3k6fKl+RFiFpyAhvO
 59ttDFI7nIAnlYngev2XUR3acFElJATHSDO0ju+hqWqAb8kVijXLops0gOfqt3VPZq9cuHlh
 IMDquatGLzAadfFx2eQYIYT+FYuMoPZy/aTUazmJIDVxP7L383grjIkn+7tAv+qeDfE+txL4
 SAm1UHNvmdfgL2/lcmL3xRh7sub3nJilM93RWX1Pe5LBSDXO45uzCGEdst6uSlzYR/MEr+5Z
 JQQ32JV64zwvf/aKaagSQSQMYNX9JFgfZ3TKWC1KJQbX5ssoX/5hNLqxMcZV3TN7kU8I3kjK
 mPec9+1nECOjjJSO/h4P0sBZyIUGfguwzhEeGf4sMCuSEM4xjCnwiBwftR17sr0spYcOpqET
 ZGcAmyYcNjy6CYadNCnfR40vhhWuCfNCBzWnUW0lFoo12wb0YnzoOLjvfD6OL3JjIUJNOmJy
 RCsJ5IA/Iz33RhSVRmROu+TztwuThClw63g7+hoyewv7BemKyuU6FTVhjjW+XUWmS/FzknSi
 dAG+insr0746cTPpSkGl3KAXeWDGJzve7/SBBfyznWCMGaf8E2P1oOdIZRxHgWj0zNr1+ooF
 /PzgLPiCI4OMUttTlEKChgbUTQ+5o0P080JojqfXwbPAyumbaYcQNiH1/xYbJdOFSiBv9rpt
 TQTBLzDKXok86M7BTQRS4TZ/ARAAkgqudHsp+hd82UVkvgnlqZjzz2vyrYfz7bkPtXaGb9H4
 Rfo7mQsEQavEBdWWjbga6eMnDqtu+FC+qeTGYebToxEyp2lKDSoAsvt8w82tIlP/EbmRbDVn
 7bhjBlfRcFjVYw8uVDPptT0TV47vpoCVkTwcyb6OltJrvg/QzV9f07DJswuda1JH3/qvYu0p
 vjPnYvCq4NsqY2XSdAJ02HrdYPFtNyPEntu1n1KK+gJrstjtw7KsZ4ygXYrsm/oCBiVW/OgU
 g/XIlGErkrxe4vQvJyVwg6YH653YTX5hLLUEL1NS4TCo47RP+wi6y+TnuAL36UtK/uFyEuPy
 wwrDVcC4cIFhYSfsO0BumEI65yu7a8aHbGfq2lW251UcoU48Z27ZUUZd2Dr6O/n8poQHbaTd
 6bJJSjzGGHZVbRP9UQ3lkmkmc0+XCHmj5WhwNNYjgbbmML7y0fsJT5RgvefAIFfHBg7fTY/i
 kBEimoUsTEQz+N4hbKwo1hULfVxDJStE4sbPhjbsPCrlXf6W9CxSyQ0qmZ2bXsLQYRj2xqd1
 bpA+1o1j2N4/au1R/uSiUFjewJdT/LX1EklKDcQwpk06Af/N7VZtSfEJeRV04unbsKVXWZAk
 uAJyDDKN99ziC0Wz5kcPyVD1HNf8bgaqGDzrv3TfYjwqayRFcMf7xJaL9xXedMcAEQEAAcLB
 XwQYAQgACQUCUuE2fwIbDAAKCRBlw/kGpdefoG4XEACD1Qf/er8EA7g23HMxYWd3FXHThrVQ
 HgiGdk5Yh632vjOm9L4sd/GCEACVQKjsu98e8o3ysitFlznEns5EAAXEbITrgKWXDDUWGYxd
 pnjj2u+GkVdsOAGk0kxczX6s+VRBhpbBI2PWnOsRJgU2n10PZ3mZD4Xu9kU2IXYmuW+e5KCA
 vTArRUdCrAtIa1k01sPipPPw6dfxx2e5asy21YOytzxuWFfJTGnVxZZSCyLUO83sh6OZhJkk
 b9rxL9wPmpN/t2IPaEKoAc0FTQZS36wAMOXkBh24PQ9gaLJvfPKpNzGD8XWR5HHF0NLIJhgg
 4ZlEXQ2fVp3XrtocHqhu4UZR4koCijgB8sB7Tb0GCpwK+C4UePdFLfhKyRdSXuvY3AHJd4CP
 4JzW0Bzq/WXY3XMOzUTYApGQpnUpdOmuQSfpV9MQO+/jo7r6yPbxT7CwRS5dcQPzUiuHLK9i
 nvjREdh84qycnx0/6dDroYhp0DFv4udxuAvt1h4wGwTPRQZerSm4xaYegEFusyhbZrI0U9tJ
 B8WrhBLXDiYlyJT6zOV2yZFuW47VrLsjYnHwn27hmxTC/7tvG3euCklmkn9Sl9IAKFu29RSo
 d5bD8kMSCYsTqtTfT6W4A3qHGvIDta3ptLYpIAOD2sY3GYq2nf3Bbzx81wZK14JdDDHUX2Rs
 6+ahAA==
In-Reply-To: <20250418071437.4144391-1-ubizjak@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 18/04/2025 8:13 am, Uros Bizjak wrote:
> diff --git a/arch/x86/boot/video.c b/arch/x86/boot/video.c
> index f2e96905b3fe..0641c8c46aee 100644
> --- a/arch/x86/boot/video.c
> +++ b/arch/x86/boot/video.c
> @@ -292,7 +292,7 @@ static void restore_screen(void)
>  			     "shrw %%cx ; "
>  			     "jnc 1f ; "
>  			     "stosw \n\t"
> -			     "1: rep;stosl ; "
> +			     "1: rep stosl ; "
>  			     "popw %%es"

Doesn't this one still need a separator between STOSL and POPW ?

~Andrew
