Received: from out162-62-57-210.mail.qq.com (out162-62-57-210.mail.qq.com [162.62.57.210])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7337236D
	for <linux-kernel@vger.kernel.org>; Mon, 21 Apr 2025 02:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.62.57.210
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745201878; cv=none; b=pAgDr2jAGD81DnlVIIVWp26B8SOKs7YT7DsUABDm2gOsEXRCunkTzCIVeGI/1AYzun1XnZuEYiZf6nqK0T5Bkip81Cfn3ZKObqzgmgBi/plXIIEFFfHdVp5kgsrwSVvEW9Dw3imSjwE8OgfknQMrDX6VT2SP4CZHIV7/vQxVZ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745201878; c=relaxed/simple;
	bh=CoZwKZ16eshnypvQfvmW6w5fJrDHqlQB/5ICizMchyg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iuO8dtCUmbXp2gPwH2FB1Ilc+edg/2zPit6SkvHPOrp/gQRKjtQC9CAUV74pJx9O7r7bWha/pdXi4Fw2VWLmd9cOHK45EPDGbzwojOD6K7GDc2SuNAU4oM9o4a9GKgTAXaSMOcGJnTF1zaIApKfnM7VSfoqhm0FyOopjhvkqBcc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com; spf=pass smtp.mailfrom=foxmail.com; dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b=ofsXXSrt; arc=none smtp.client-ip=162.62.57.210
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=foxmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=foxmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=foxmail.com header.i=@foxmail.com header.b="ofsXXSrt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foxmail.com;
	s=s201512; t=1745201562;
	bh=CoZwKZ16eshnypvQfvmW6w5fJrDHqlQB/5ICizMchyg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=ofsXXSrtpf3WQuAzaIM0QFhsQq76n8wof8fUZ/jn5y8yLKlm90OpQV71oYv8zrY6c
	 7iIQBqEkgb1H8iN2PGgWg9kjmpX3PKbD94d3tDtO7XrEG4PuYc9ybV9cHI25W4R3IZ
	 P/vVNY/Pk5s28+seE/jNMwuxZ2sEO+94dnBwvevQ=
Received: from [10.42.13.56] ([116.128.244.169])
	by newxmesmtplogicsvrszgpua8-1.qq.com (NewEsmtp) with SMTP
	id 19E2D815; Mon, 21 Apr 2025 10:06:30 +0800
X-QQ-mid: xmsmtpt1745201190t3j8q93uq
Message-ID: <tencent_DB84706B5135401678FD9E84CC6DB8C2450A@qq.com>
X-QQ-XMAILINFO: NBOcPERDMH3ARddM0gQ4sHKdGkLe/STVO4dj5bYP5pQUoIW1k6UkaOXESX6Tep
	 bbp0+2QRySp7xOnD1rcHx0x6DgWKeRZZ+0CYqi+I0xfUz4nx7x0DqpYHFvNMJv7g2ycvfFs4kJmm
	 ap4MJ/2RsBmKQQuzO2Q0C99ys2fopm93SzILhcWCJhV3fD/tu93sJ7daYQQa3szaSRVwD5aNXV5v
	 TSHJd0uaM6TxZKu1kdPZMBdIKWxWU2YOqxoRaSwgn8nsNIkFmH4pqwBL5RkyvwMz00vJ5srXHL91
	 2scNaoClTqX+tqYAkkvVtIxGY8rdDJjJ46nVDQPnnL6CiRCuaL4DFIj9BIioFo3q91sbHst8G4gB
	 GEPziNqbw5nzePvjHAB5rxxkrjegB1zymF8yCHkw3/n4AU2mSVTydESmcvtd66oLNQ7CprWX5MnG
	 GSfWNeEaLv6z0RlEtjlp//DBR1bgmsVvi/GpqWjBUItl2O7dPlokWhkr8sPAJJoKTBekcDSXFkuT
	 F2SG8S8kd6XBT/XKSYHVjpCdevV/IUvDbMHtv7tFTVSP800TXFaq50DcvId8zRfmmy/+xKok43iy
	 eQrHc1TDt8ifW2fCIscyCtvi/AVFrs2Mzjov0hwk9/UKxIrOtBlHVlZicEunaeFH+F20zbIr2qY6
	 Bv0YtNBSEHR/cC28+7LefySmIhh5lrjD/C+pWp/mAQ97gd4K5RV2W/fjdGjsW7rw4D8rl2u/BpHo
	 qApPjDs5FRNc6rFBQ3ly6h+Tz3k/nTq/qmRTvM1SGmdT45jjesm2sE7VLhEjedDNFHHQnF5rotwN
	 Pq4LUt4Xg2s7V9txEvDNdZOAeeSa3V2Av2IMwzp2FPX1jHmtVjDUe6X9X8E9jha0jxm4gRMVgXkc
	 sfD+Pu7X3VWdqaGB53twsr6w9Vg5FI0mmw0BEwfwr/YygbglXKtELxdLknRxeDj7UG2Cajt2dHLD
	 oMh0tsTK7L9suO+cYvqBpb21lMV3UDWuDkBbP8f7U=
X-QQ-XMRINFO: NI4Ajvh11aEj8Xl/2s1/T8w=
X-OQ-MSGID: <1fc3e9e5-34bc-4130-b459-59b66ba0e339@foxmail.com>
Date: Mon, 21 Apr 2025 10:06:28 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] bus: hisi_lpc: remove unused head file in hisi_lpc.c
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-kernel@vger.kernel.org, f.fangjian@huawei.com, robh@kernel.org,
 john.g.garry@oracle.com, xuwei5@hisilicon.com,
 Pei Xiao <xiaopei01@kylinos.cn>
References: <cover.1744964101.git.xiaopei01@kylinos.cn>
 <tencent_8024B8D7E209E31C8E2B5AC411B70C551106@qq.com>
 <aAO_mIY99CMH4o8d@smile.fi.intel.com>
From: Pei Xiao <xiaopeitux@foxmail.com>
In-Reply-To: <aAO_mIY99CMH4o8d@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit


在 2025/4/19 23:22, Andy Shevchenko 写道:
> On Fri, Apr 18, 2025 at 04:51:23PM +0800, xiaopeitux@foxmail.com wrote:
>> From: Pei Xiao <xiaopei01@kylinos.cn>
>>
>> linux/console.h,linux/io.h,linux/pci.h,linux/slab.h
>> are not used, this patch removes it.
> Definitely you haven't tested this...

Sorry for that,I have tested in ARM64 platform, have no build problem,sorry for that!

Pei ,

thanks!

