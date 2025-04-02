Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 751A4B674
	for <linux-kernel@vger.kernel.org>; Wed,  2 Apr 2025 18:17:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743617828; cv=none; b=uMjHN5FYr/y5zJpyofniA/yF1i6CDbq9j6kk0DlGJVaA5Gk1+mSs2/4X66yOVyIzxLRRN0xc4LzI0Vxp94rfYgmvB62ZBABACxeMzyv2f9Hvm23D+LVnxAUWBPJntjsI6oG7uZHD41DLXjVp0coosupGFNBbaZWJBiKrvrL0P8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743617828; c=relaxed/simple;
	bh=mAonoSD66lGCnVU7JNG9n8GfqUd0LhY/NUdQJAgZxE4=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=BQuwveBY/EjnGkf1jcjnDhX66foktt0Gzh4HW1eVEECwb4LAzfK+ODAZQ/xNX17HJvutx3l2p3o4Glxh0rmla5m/ivma6K3NHAMterMRULKfvbBIvp+tWEnpAY0FAYBOOofn7j0DiUggdYyEGw6E5dVjtasgPaNyUEfu6vhSC8Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com; spf=pass smtp.mailfrom=cloud.com; dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b=OKkTWefn; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=citrix.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=citrix.com header.i=@citrix.com header.b="OKkTWefn"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-39c0dfad22aso66709f8f.2
        for <linux-kernel@vger.kernel.org>; Wed, 02 Apr 2025 11:17:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=citrix.com; s=google; t=1743617825; x=1744222625; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=mAonoSD66lGCnVU7JNG9n8GfqUd0LhY/NUdQJAgZxE4=;
        b=OKkTWefn5l/nnIo3bOx+KPEpHGtvT8mrxg+nQmWQpubRVZwyNFTeLLaVvSDixvElwv
         Z+ZAAhqTWEcwZqNOtyNH0PviMY4hbVHAaHD61gAfAY6ri9GEXxl8fHWfUiHHw+ia0kFx
         XrQT6GT5pG34A3zE0df4tQjtVuGzMt6BhzPu0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743617825; x=1744222625;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mAonoSD66lGCnVU7JNG9n8GfqUd0LhY/NUdQJAgZxE4=;
        b=G3ruQ/ZcX3yoB8JHussnppefl+6cXH142UQnXLTYBazJdcDxj7h0C2lXi1BptARbYS
         0i/cFyZtXPuya9RXj1ByE+7n2B6pl9mHnkDRE0zX+i1kIhGIuzqNcLChKPn+XF9PuXSQ
         SrwYkqSdIHH20R6adg2H8ZJanrF8alGrC+fg1XcW6tQXNxrXsLV+n8ETl70nWaOVniXf
         PD+ikAu/W6rAQ+pEJcvO0s/iWtycvM0wKdR/su7ZEjXp2rxGS56KAMUWKEjXR6ve7RPS
         N+/sBmdPlsCkiM3qCrB/Mhitp0b9EEHf41sk8+rCsW9ja0F3aD185vc25cu1lDtLwAR6
         n5QQ==
X-Gm-Message-State: AOJu0YxXrWlpWtv+53RcCratfu4JMMxKthATOvavoVpndxdHu+yW+per
	nTCWkaM0ReHCD33Af+n32COHSZsjmpTWRc2f+UHqPKWaVxCf0iLhIDutoVjI7rA=
X-Gm-Gg: ASbGncu5Y1cas4bmUr/+Txr1u4U+UxgkkWTsi9zvbE1sDpESJsHEkFj690fku4wH7es
	mzFwhaZQovjosGRtOKCGox0uu0OBkjOiDy7D6pmLRI1RfIqfGbycRZILCNctA3qwbmKHfdMywp+
	C/YYjBQat0t3TiSAe3a4JzIdnvxi91zKsWx3UWO4HE/krSHRl/62MrcMQuTaD6+0thZR4fI+6zo
	7TPOSz0qDaaOag3Hk2gOxr+2ZZUCt8LpkoYZapVu4/UpPOjz3VyXUzaR84VoXAy8JCxGiMaVP8q
	Rf5zC9iA/KqPUP6AF0V7VAqGlAvxdWFfzXmE13BjkAF/2Hson/kwDvNNzALR4gjgAyDcxufCu8w
	5K/qkDAyDqA==
X-Google-Smtp-Source: AGHT+IFAxPje6IbK4FDIfydGEQI2lE0z4hNiKeRvDOQc7i+Y05dONSV6SU3/0Vmiwjae87ZPRUkYzA==
X-Received: by 2002:a5d:588e:0:b0:391:3157:7717 with SMTP id ffacd0b85a97d-39c23650ed0mr6977973f8f.34.1743617824676;
        Wed, 02 Apr 2025 11:17:04 -0700 (PDT)
Received: from [192.168.1.183] (host-92-26-98-202.as13285.net. [92.26.98.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43eb5fd0a46sm28767295e9.9.2025.04.02.11.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 02 Apr 2025 11:17:04 -0700 (PDT)
Message-ID: <948fffdc-d0d8-49c4-90b6-b91f282f76c9@citrix.com>
Date: Wed, 2 Apr 2025 19:17:03 +0100
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: mjguzik@gmail.com
Cc: linux-kernel@vger.kernel.org, mingo@redhat.com,
 torvalds@linux-foundation.org, x86@kernel.org,
 "Peter Zijlstra (Intel)" <peterz@infradead.org>
References: <CAGudoHEV-PFSr-xKUx5GkTf4KasJc=aNNzQbkoTnFVLisKti+A@mail.gmail.com>
Subject: Re: [RFC PATCH] x86: prevent gcc from emitting rep movsq/stosq for
 inlined ops
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
In-Reply-To: <CAGudoHEV-PFSr-xKUx5GkTf4KasJc=aNNzQbkoTnFVLisKti+A@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

> Please make this a gcc bug-report instead - I really don't want to
> have random compiler-specific tuning options in the kernel. Because
> that whole memcpy-strategy thing is something that gets tuned by a lot
> of other compiler options (ie -march and different versions).

I've discussed this with PeterZ in the past, although I can't for the
life of me find the bugzilla ticket I thought I opened on the matter. 
(Maybe I never got that far).

The behaviour wanted is:

1) Convert to plain plain accesses (so they can be merged/combined/etc), or
2) Emit a library call

because we do provide forms that are better than the GCC-chosen "REP
MOVSQ with manual alignment" in the general case.

Taking a leaf out of the repoline book, the ideal library call(s) would be:

    CALL __x86_thunk_rep_{mov,stos}sb

using the REP ABI (parameters in %rcx/%rdi/etc), rather than the SYSV ABI.

For current/future processors, which have fast reps of all short/zero
flavours, we can even inline the REP {MOV,STO}S instruction to avoid the
call.

For older microarchitectures, they can reuse the existing memcpy/memset
implementations, just with marginally less parameter shuffling.

How does this sound?

~Andrew
