Received: from bali.collaboradmins.com (bali.collaboradmins.com [148.251.105.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E239B1E5205;
	Thu, 12 Jun 2025 07:22:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.251.105.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749712968; cv=none; b=oHpZogOONh35KCwdnUZmKQ0BzGYJt/Nc6uVHh2Ktgtw2P1PEMRjo9GP4jvHGk0W2PZMmt6IqfWUoB0zq1kHzVeXyIrzIO0+iXZG8CMRGXx8SFrI5oUZUfPBAk8SroffbbS3TbwWhFokFUvShSqvr/2BE6RwBS8HJcvhCTKS9S6k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749712968; c=relaxed/simple;
	bh=ZehpXxmYsbsI5/Zo9umdDbpEir12rf3VRJ6I07fE2Io=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=O5FLTUqaGLxbs9SMlJIXYccZxxyR4Jh57nPuyHMKPw8EpiX9URz32vixOHxOpR5Cjn+RBEECem09Wnyncy0TsCNbbcPUDOiUGcS1FwqdRaZkIhUgTYpxVCnPa2PBWHked6whRhUftTFcsZR1yY19dGXIDzxjLn1+6xEVBTs3bUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b=M+srkHvI; arc=none smtp.client-ip=148.251.105.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=collabora.com header.i=@collabora.com header.b="M+srkHvI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1749712963;
	bh=ZehpXxmYsbsI5/Zo9umdDbpEir12rf3VRJ6I07fE2Io=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=M+srkHvIBdhivlVs3+YtvQaEHfe8UAnA0VDHKAHGssBgqvYHIMHCF/NI3PF+O3Ldw
	 QSvSNGjr4570h0XdVEICCwzaxpbEoqFKWxnYJ+5Gb8fHPiwPyD+P3/Ey40oiJuBu+L
	 j0XkX976spxBSqvhsMvpW2jgPF5HM868iSTJJSahMgvyN2DH4vgjVkyUSjn9rPgyGJ
	 GpFTL7Gav1WRVcmqdNGVPScTbjjJPTnKMvZ0herwVWk8VpzMISQ17xNbEOeXNXrtag
	 1Fru/PhFjRHqKZHfCpHzXCzI/mtUpCA37W/yn8gpFRwhQAFBdcBr3xaO0uPsIADgdE
	 liN6PN9JYlT6g==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6C8E417E0456;
	Thu, 12 Jun 2025 09:22:43 +0200 (CEST)
Message-ID: <b8f6fb15-cc77-41c5-b362-70cfd6be6f37@collabora.com>
Date: Thu, 12 Jun 2025 10:22:36 +0300
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] ALSA: usb-audio: Convert comma to semicolon
To: Takashi Iwai <tiwai@suse.de>, Chen Ni <nichen@iscas.ac.cn>
Cc: perex@perex.cz, tiwai@suse.com, franta-linux@frantovo.cz,
 lina+kernel@asahilina.net, livvy@base.nu, sstistrup@gmail.com, s@srd.tw,
 linux-sound@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250612060228.1518028-1-nichen@iscas.ac.cn>
 <87ikl1v4cj.wl-tiwai@suse.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <87ikl1v4cj.wl-tiwai@suse.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 6/12/25 9:52 AM, Takashi Iwai wrote:
> On Thu, 12 Jun 2025 08:02:28 +0200,
> Chen Ni wrote:
>>
>> Replace comma between expressions with semicolons.
>>
>> Using a ',' in place of a ';' can have unintended side effects.
>> Although that is not the case here, it is seems best to use ';'
>> unless ',' is intended.
>>
>> Found by inspection.
>> No functional change intended.
>> Compile tested only.
>>
>> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>
> 
> Thanks, applied now.
> 
> At the next time, though, it'd be appreciated if you can put the
> proper Fixes tag.

Considering this is not really a functional change, I think a 
Fixes tag would trigger an unnecessary backport, wouldn't it?

Regards,
Cristian
