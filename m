Received: from alerce.blitiri.com.ar (alerce.blitiri.com.ar [49.12.208.134])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9556C28A411
	for <linux-kernel@vger.kernel.org>; Tue, 24 Jun 2025 11:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=49.12.208.134
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750763417; cv=none; b=sBxPxtANXJchtB9EZnO09FkO/SrD0cHiyAUqzGYYV3TWViuOQ4GppsNCaS5R8tCKeC+Pq/FnJD7Al5IuGd0w8pX3e+atkiPjDwBR7H5ND8sz0ogs42CtD5n5ZcmxjiXXwD48fTu6AVqatKDVxEAIlR+ncaYoZQ7NfTf0eJrVDqU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750763417; c=relaxed/simple;
	bh=Simcz+dPz1lMznCnH08QtMUqetrxTlmKokt29TSkifI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IhkUjAqgTbjy7WS1KfeO+1k7am3f1IeNy/zzfLTtoOo1w3oQFL6jybc31DYjirv0kjbv7EC2VPkVdj+/RIhx/gkrMhemkkhQo+fucmjUbzgvPFVUlVo3kqEpcV4wY/L0XbES+4DW3WG8z4lQ+wsKigtUxDmuOmn0KwDGX4UrjoY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdfg.com.ar; spf=pass smtp.mailfrom=sdfg.com.ar; arc=none smtp.client-ip=49.12.208.134
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sdfg.com.ar
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sdfg.com.ar
Received: from [IPV6:2a02:8109:aa17:ae00:b843:3b62:2e09:ec2f]
	by sdfg.com.ar (chasquid) with ESMTPSA
	tls TLS_AES_128_GCM_SHA256
	(over submission+TLS, TLS-1.3, envelope from "rodrigo@sdfg.com.ar")
	; Tue, 24 Jun 2025 11:08:52 +0000
Message-ID: <86bc2557-b9cc-4767-9379-e60786b3f825@sdfg.com.ar>
Date: Tue, 24 Jun 2025 13:08:51 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] selftests/nolibc: avoid GCC 15
 -Wunterminated-string-initialization
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>,
 Willy Tarreau <w@1wt.eu>, Shuah Khan <shuah@kernel.org>
Cc: linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250623-nolibc-nonstring-v1-1-11282204766a@weissschuh.net>
Content-Language: en-US
From: Rodrigo Campos <rodrigo@sdfg.com.ar>
In-Reply-To: <20250623-nolibc-nonstring-v1-1-11282204766a@weissschuh.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/23/25 11:34 PM, Thomas Weißschuh wrote:
> On GCC 15 the following warnings is emitted:
> 
> nolibc-test.c: In function ‘run_stdlib’:
> nolibc-test.c:1416:32: warning: initializer-string for array of ‘char’ truncates NUL terminator but destination lacks ‘nonstring’ attribute (11 chars into 10 available) [-Wunterminated-string-initialization]
>   1416 |                 char buf[10] = "test123456";
>        |                                ^~~~~~~~~~~~
> 
> Increase the size of buf to avoid the warning.
> 
> It would also be possible to use __attribute__((nonstring)) but that
> would require some ifdeffery to work with older compilers.
> 
> Fixes: 1063649cf531 ("selftests/nolibc: Add tests for strlcat() and strlcpy()")
> Signed-off-by: Thomas Weißschuh <linux@weissschuh.net>
> ---
>   tools/testing/selftests/nolibc/nolibc-test.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/tools/testing/selftests/nolibc/nolibc-test.c b/tools/testing/selftests/nolibc/nolibc-test.c
> index dbe13000fb1ac153e9a89f627492daeb584a05d4..52640d8ae402b9e34174ae798e74882ca750ec2b 100644
> --- a/tools/testing/selftests/nolibc/nolibc-test.c
> +++ b/tools/testing/selftests/nolibc/nolibc-test.c
> @@ -1413,7 +1413,7 @@ int run_stdlib(int min, int max)
>   		 * Add some more chars after the \0, to test functions that overwrite the buffer set
>   		 * the \0 at the exact right position.
>   		 */
> -		char buf[10] = "test123456";
> +		char buf[11] = "test123456";
>   		buf[4] = '\0';

Reviewed-by: Rodrigo Campos <rodrigo@sdfg.com.ar>

Sorry for the typo :)



Best,
Rodrigo
