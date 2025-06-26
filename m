Received: from out0-202.mail.aliyun.com (out0-202.mail.aliyun.com [140.205.0.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BA961FFC41
	for <linux-kernel@vger.kernel.org>; Thu, 26 Jun 2025 14:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.205.0.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750947513; cv=none; b=ADHN4slzwMaLUDBu/NPExs/T+qdXCrAxRq92toqcsIMLHPmCuy39PpSiTd4rpjX5uqm/QYjqDmOCqaqbU7VaqJZwqI6BpOZRGAriF4zNkI7oX92UCa6knhoQsc7Lfu7MiiKrPJqOViY0UKl7KsGKmcfdBZ9xJuG23kTgIbx0kjM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750947513; c=relaxed/simple;
	bh=UToGqjLniKEjOcmMftRQQ79V2lDC11PqirLgMZbbQEA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=h9I4hzRud3lyuufQi2Le8mLaFCuBOdxydB4oyVxV2Wxj2N5wTrE/KY2cBK15gXsmodBt1N/7DR0a2sPhklkH9fSL6yo5B6eHrzLuuqsRSF68Jj1/acaMCt3OT1rY8bhODsU8lQjrJvnSdvJD6S13eGMpyNsgueaFfcL9kOwlkHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com; spf=pass smtp.mailfrom=antgroup.com; dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b=aWoSek5z; arc=none smtp.client-ip=140.205.0.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=antgroup.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=antgroup.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=antgroup.com header.i=@antgroup.com header.b="aWoSek5z"
DKIM-Signature:v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=antgroup.com; s=default;
	t=1750947500; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=NnA5hU4w76XtfuXjc9T7ovjYs8AsRuW+URyzZY2p7PU=;
	b=aWoSek5zv7djO32Qt/sSsyUuv9pTQEsI6asvl8HZ7Y0/UD2BnLRHUaPjPnQ7cUiFPUpGpHCSFjQhySmDYQsffA7stn+uBTpNLhqtrNubmFVohXD3m1JvQA02dq7ooE9j3vVd9Tau5ca+H1J3r+VrlvFpM23cnVglz/gk1sqp8yM=
Received: from 30.174.123.233(mailfrom:tiwei.btw@antgroup.com fp:SMTPD_---.dXILOmi_1750947492 cluster:ay29)
          by smtp.aliyun-inc.com;
          Thu, 26 Jun 2025 22:18:20 +0800
Message-ID: <963cbbe7-8064-461e-b134-1a43e037c33a@antgroup.com>
Date: Thu, 26 Jun 2025 22:18:12 +0800
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [GIT PULL] uml-for-6.16-rc4
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Johannes Berg <johannes@sipsolutions.net>, linux-kernel@vger.kernel.org,
 linux-um@lists.infradead.org, Richard Weinberger <richard@nod.at>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>
References: <20250625121529.42911-3-johannes@sipsolutions.net>
 <CAHk-=wjTCAzaw4AXXpxcYc7v7ZjAeyaOOJw7FWXO+gV7v7Cp0g@mail.gmail.com>
 <0d630dec-41fe-4968-8d6a-7faae8a554a1@antgroup.com>
 <CAHk-=wh=_ZmpYtCx11wqsGGdrZRHsPorTzpzh2-QccT8PGKW1w@mail.gmail.com>
Content-Language: en-US
From: "Tiwei Bie" <tiwei.btw@antgroup.com>
In-Reply-To: <CAHk-=wh=_ZmpYtCx11wqsGGdrZRHsPorTzpzh2-QccT8PGKW1w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2025/6/26 11:48, Linus Torvalds wrote:
> On Wed, 25 Jun 2025 at 19:44, Tiwei Bie <tiwei.btw@antgroup.com> wrote:
>>
>> The behavior of gcc and clang differs. Clang's behavior appears to be
>> related to the volatile qualifier in arch_spinlock_t:
> 
> Ahh. That kind of makes sense.

I also just noticed it today after taking a closer look.

> 
> At the same time, I think clang is being stupid here. Yes, it makes
> sense to treat volatile specially in this way - just not for an
> initializer.
> 
> I realize that initializers can be made to be their own data
> structures in modern C (ie taking the address of an initializer and
> using the initializer itself as an argument to a function call, for
> example), but when an initializer is used to set the value of a
> variable, the only real thing there is that variable.

That makes sense!

> 
> Oh well. The patch certainly looks fine and I obviously already merged
> the pull request.

Yeah, I saw that. Thanks! :)

> It does make me go "I wonder how many other places
> clang just generates stupid code due to this".

+1.

Regards,
Tiwei

