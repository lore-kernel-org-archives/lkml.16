Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AE44537F8
	for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 14:05:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745589924; cv=none; b=P7XWIcns5JAWn6uk2FEjAUdnKGPILnKFXWu9p0fwwBXkM5MtSUZMyl1Ti5bZzcCW2SFOMxcMEnitbA1VxPCkGVLwXTC7bNUmfyb14gaGccxB+symLY6PkVnLwpGgGKIILnWrYjSasdFHgSe1YMPyTRe8cd3Tjz156kPAxQl8IJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745589924; c=relaxed/simple;
	bh=HjSsdxdE9NyGgJS9GCqGafk2gzAj2H4hnr8cVPyhdtE=;
	h=Content-Type:Message-ID:Date:MIME-Version:Subject:To:Cc:
	 References:From:In-Reply-To; b=RvSTAOizbetPL/X2SSG9ABQeHyuYoDZrMaScL2NMRRfNVQLUj3V3KV5WjBFKsdOfZyBBIV3uqTZnpntmmtiLz3PeZCMBDVHQEuqUZxejg/Ac+5j/oubQRTH4U02Nc+m+X10ih0fFAM7oSvbic+WHo/H7HN6j3buKZQGA8xBxtuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eADtGQQC; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eADtGQQC"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-aaecf50578eso352474266b.2
        for <linux-kernel@vger.kernel.org>; Fri, 25 Apr 2025 07:05:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745589917; x=1746194717; darn=vger.kernel.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3LCw/MgP3XEKxNv5aRVxq1OQohgxDYMo6gz2G3JzZjs=;
        b=eADtGQQCaVulIBAwIaVsPDjXru1fwWgtPYYxNYy6k4amclgV19b6iWv8gHdpah5vqJ
         q2bBYtwQ9P1ZZpQVYSxId1RLgXN3Th04favpdlhLw5d+qkAF+ZkHERSO4rqOp8bIJn1q
         0r+n2vv6BUgB6xGhv3H5KXAlbM7JsVfopBiWShpOQANMGPXneoM0nDDLyFQXlqJU4UfP
         pZRlvJrVq7B98de6YY5MZXW5eBH8lFdLGbAsNJIg6ZPHCtZhzJsUKVLG6q+neYWWz8/B
         fGTJtrt09aQkP1e7J1iB/HXgETSdx9VQBE8tQks++BlAbbyxdI9IO07YXpzZPs2Vwpeg
         JmgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745589917; x=1746194717;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=3LCw/MgP3XEKxNv5aRVxq1OQohgxDYMo6gz2G3JzZjs=;
        b=qUyMsUkCDYonn9RDJSiAGDjAVcxvcQp5LbcruVYR8+nK0ENmtZzYrOCr29UtuJyy0y
         w25EWwx39r2rD53r5yebHQAzTrUWLXCI2MYgmBv86HpbFf/zAjx9zYzqDNXaidH9Ah26
         rw0U4rqV25yQvkqiH9ky1nUP51kWEWx8sYL2+JC2Xx3Fqu/+vhBxMRHFds1/z7pNqOfk
         nbhFl6BPwxHDHZC5NEMK4sQlENg0nigDQdXEjyS/+83hKtksrZmVrh5wd9LsN1R2S4h5
         wvfaP+xN62aKFxwGaGGp62dJZvQMCH8gVPBT1tc2QBBRil1q+aYIbIPg789g6RUgHPT0
         rWsQ==
X-Forwarded-Encrypted: i=1; AJvYcCXKJ57oAimISuH+l/73W28IHxkwBY5rE+vgoumZ6wHIGbU9aWyPkZJxWq6ZVdjEEjHsmN0RyxlO9oDNwac=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOe12ZXAmLDnm0DOagg5c9MOzuQ9oQLHTh4lWqsgi5HCeY8t09
	nxnYYVsT6J9Vl8ZUB+svWcJudjSmfMqSelmvU/V5wDUywywEs6u+LTu2Kr/5
X-Gm-Gg: ASbGncug+OojSdKMATTPmUJjMTN/f7usYZD3boBmIYWsQ7vs1lOJCoC5xzEDJ+xIT1C
	c4rYIurecqVTbGFa/34LhzeisBhiyCWh5oMAUip0FuNjtvb98roU0/xy+km3nWmdket9LNWlh2A
	fMGpAWGIiFN3qK5zkzsTOEGhq744/QVdyiHD1Cq0tXDHeSqxCqEqGPDm04QxCzZNmhA7BrMEXwq
	UMggIdrfPjaeqr3ZmnebtRrnsb9Zt6KFvA78ud39DN+bcfhj+wQVJPphiHh32n5x3MzInzwwO07
	5KlSiYrdoZ4JAI5XdR4DBYGJNo19uV8swk7Z/qsaQQ==
X-Google-Smtp-Source: AGHT+IGO6f7Pi4UOW3QsPuiNoBivx1U0eHxe4dctUaLMeU47U+Zqdei8tzT8IVRPQYOqLMuz6fImGA==
X-Received: by 2002:a17:906:c153:b0:ac3:8988:deda with SMTP id a640c23a62f3a-ace7136cb5cmr190335466b.40.1745589917041;
        Fri, 25 Apr 2025 07:05:17 -0700 (PDT)
Received: from [192.168.1.100] ([46.248.82.114])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ace6ecf8ca6sm139246066b.118.2025.04.25.07.05.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Apr 2025 07:05:16 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------7fYHuXv1MXr1zGZT1rHlAPO4"
Message-ID: <15696bb3-126b-ef71-f838-80e1e1c1b0aa@gmail.com>
Date: Fri, 25 Apr 2025 16:05:14 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
Subject: Re: [PATCH 14/15] x86/percpu: Remove !CONFIG_X86_CX8 methods
To: Ingo Molnar <mingo@kernel.org>, linux-kernel@vger.kernel.org
Cc: "Ahmed S . Darwish" <darwi@linutronix.de>,
 Andrew Cooper <andrew.cooper3@citrix.com>, Ard Biesheuvel <ardb@kernel.org>,
 Arnd Bergmann <arnd@kernel.org>, Borislav Petkov <bp@alien8.de>,
 Dave Hansen <dave.hansen@linux.intel.com>, "H . Peter Anvin"
 <hpa@zytor.com>, John Ogness <john.ogness@linutronix.de>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>
References: <20250425084216.3913608-1-mingo@kernel.org>
 <20250425084216.3913608-15-mingo@kernel.org>
Content-Language: en-US
From: Uros Bizjak <ubizjak@gmail.com>
In-Reply-To: <20250425084216.3913608-15-mingo@kernel.org>

This is a multi-part message in MIME format.
--------------7fYHuXv1MXr1zGZT1rHlAPO4
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit



On 25. 04. 25 10:42, Ingo Molnar wrote:
> TODO: review the constraints.
> 
> NOT-Signed-off-by: Ingo Molnar <mingo@kernel.org>
> ---
>   arch/x86/include/asm/percpu.h | 6 ++----
>   1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/x86/include/asm/percpu.h b/arch/x86/include/asm/percpu.h
> index 5fe314a2e73e..275c76a031ee 100644
> --- a/arch/x86/include/asm/percpu.h
> +++ b/arch/x86/include/asm/percpu.h
> @@ -334,8 +334,7 @@ do {									\
>   	new__.var = _nval;						\
>   									\
>   	asm_inline qual (						\
> -		ALTERNATIVE("call this_cpu_cmpxchg8b_emu",		\
> -			    "cmpxchg8b " __percpu_arg([var]), X86_FEATURE_CX8) \
> +		"cmpxchg8b " __percpu_arg([var])			\
>   		: ALT_OUTPUT_SP([var] "+m" (__my_cpu_var(_var)),	\
>   				"+a" (old__.low), "+d" (old__.high))	\
>   		: "b" (new__.low), "c" (new__.high),			\

There is no need for asm_inline, ALT_OUTPUT_SP() macro and "S" input 
(that was used to force the compiler to put the memory argument into 
%esi register):

	asm qual ("cmpxchg8b " __percpu_arg([var])		\
		: "+m" (__my_cpu_var(_var)),			\
		  "+a" (old__.low), "+d" (old__.high)		\
		: "b" (new__.low), "c" (new__.high)		\
		: "memory");					\

> @@ -363,8 +362,7 @@ do {									\
>   	new__.var = _nval;						\
>   									\
>   	asm_inline qual (						\
> -		ALTERNATIVE("call this_cpu_cmpxchg8b_emu",		\
> -			    "cmpxchg8b " __percpu_arg([var]), X86_FEATURE_CX8) \
> +		"cmpxchg8b " __percpu_arg([var])			\
>   		CC_SET(z)						\
>   		: ALT_OUTPUT_SP(CC_OUT(z) (success),			\
>   				[var] "+m" (__my_cpu_var(_var)),	\

Same here:

	asm qual ("cmpxchg8b " __percpu_arg([var])		\
		CC_SET(z)					\
		: CC_OUT(z) (success),				\
		  [var] "+m" (__my_cpu_var(_var)),		\
		  "+a" (old__.low), "+d" (old__.high)		\
		: "b" (new__.low), "c" (new__.high)		\
		: "memory");					\

Please see the attached patch that implements the change.

Uros.
--------------7fYHuXv1MXr1zGZT1rHlAPO4
Content-Type: text/plain; charset=UTF-8; name="percpu_cmpxchg.diff.txt"
Content-Disposition: attachment; filename="percpu_cmpxchg.diff.txt"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BlcmNwdS5oIGIvYXJjaC94ODYv
aW5jbHVkZS9hc20vcGVyY3B1LmgKaW5kZXggYjBkMDNiNmMyNzliLi42NGMyZTcxNWFmNjMg
MTAwNjQ0Ci0tLSBhL2FyY2gveDg2L2luY2x1ZGUvYXNtL3BlcmNwdS5oCisrKyBiL2FyY2gv
eDg2L2luY2x1ZGUvYXNtL3BlcmNwdS5oCkBAIC0zMzUsMTMgKzMzNSwxMCBAQCBkbyB7CQkJ
CQkJCQkJXAogCW9sZF9fLnZhciA9IF9vdmFsOwkJCQkJCVwKIAluZXdfXy52YXIgPSBfbnZh
bDsJCQkJCQlcCiAJCQkJCQkJCQlcCi0JYXNtX2lubGluZSBxdWFsICgJCQkJCQlcCi0JCUFM
VEVSTkFUSVZFKCJjYWxsIHRoaXNfY3B1X2NtcHhjaGc4Yl9lbXUiLAkJXAotCQkJICAgICJj
bXB4Y2hnOGIgIiBfX3BlcmNwdV9hcmcoW3Zhcl0pLCBYODZfRkVBVFVSRV9DWDgpIFwKLQkJ
OiBBTFRfT1VUUFVUX1NQKFt2YXJdICIrbSIgKF9fbXlfY3B1X3ZhcihfdmFyKSksCVwKLQkJ
CQkiK2EiIChvbGRfXy5sb3cpLCAiK2QiIChvbGRfXy5oaWdoKSkJXAotCQk6ICJiIiAobmV3
X18ubG93KSwgImMiIChuZXdfXy5oaWdoKSwJCQlcCi0JCSAgIlMiICgmKF92YXIpKQkJCQkJ
CVwKKwlhc20gcXVhbCAoImNtcHhjaGc4YiAiIF9fcGVyY3B1X2FyZyhbdmFyXSkJCQlcCisJ
CTogIittIiAoX19teV9jcHVfdmFyKF92YXIpKSwJCQkJXAorCQkgICIrYSIgKG9sZF9fLmxv
dyksICIrZCIgKG9sZF9fLmhpZ2gpCQkJXAorCQk6ICJiIiAobmV3X18ubG93KSwgImMiIChu
ZXdfXy5oaWdoKQkJCVwKIAkJOiAibWVtb3J5Iik7CQkJCQkJXAogCQkJCQkJCQkJXAogCW9s
ZF9fLnZhcjsJCQkJCQkJXApAQCAtMzY0LDE1ICszNjEsMTIgQEAgZG8gewkJCQkJCQkJCVwK
IAlvbGRfXy52YXIgPSAqX292YWw7CQkJCQkJXAogCW5ld19fLnZhciA9IF9udmFsOwkJCQkJ
CVwKIAkJCQkJCQkJCVwKLQlhc21faW5saW5lIHF1YWwgKAkJCQkJCVwKLQkJQUxURVJOQVRJ
VkUoImNhbGwgdGhpc19jcHVfY21weGNoZzhiX2VtdSIsCQlcCi0JCQkgICAgImNtcHhjaGc4
YiAiIF9fcGVyY3B1X2FyZyhbdmFyXSksIFg4Nl9GRUFUVVJFX0NYOCkgXAorCWFzbSBxdWFs
ICgiY21weGNoZzhiICIgX19wZXJjcHVfYXJnKFt2YXJdKQkJCVwKIAkJQ0NfU0VUKHopCQkJ
CQkJXAotCQk6IEFMVF9PVVRQVVRfU1AoQ0NfT1VUKHopIChzdWNjZXNzKSwJCQlcCi0JCQkJ
W3Zhcl0gIittIiAoX19teV9jcHVfdmFyKF92YXIpKSwJXAotCQkJCSIrYSIgKG9sZF9fLmxv
dyksICIrZCIgKG9sZF9fLmhpZ2gpKQlcCi0JCTogImIiIChuZXdfXy5sb3cpLCAiYyIgKG5l
d19fLmhpZ2gpLAkJCVwKLQkJICAiUyIgKCYoX3ZhcikpCQkJCQkJXAorCQk6IENDX09VVCh6
KSAoc3VjY2VzcyksCQkJCQlcCisJCSAgW3Zhcl0gIittIiAoX19teV9jcHVfdmFyKF92YXIp
KSwJCQlcCisJCSAgIithIiAob2xkX18ubG93KSwgIitkIiAob2xkX18uaGlnaCkJCQlcCisJ
CTogImIiIChuZXdfXy5sb3cpLCAiYyIgKG5ld19fLmhpZ2gpCQkJXAogCQk6ICJtZW1vcnki
KTsJCQkJCQlcCiAJaWYgKHVubGlrZWx5KCFzdWNjZXNzKSkJCQkJCQlcCiAJCSpfb3ZhbCA9
IG9sZF9fLnZhcjsJCQkJCVwK

--------------7fYHuXv1MXr1zGZT1rHlAPO4--
