Received: from out28-125.mail.aliyun.com (out28-125.mail.aliyun.com [115.124.28.125])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33C75372;
	Tue, 24 Jun 2025 07:03:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=115.124.28.125
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750748601; cv=none; b=rUNAfw+VQLF5dU/lI3d5k8dPjEaQ95qfe/tuF37j40EELomj8vhH32leU+ccia96GZpDxXiK5l09GK5MCoAyoTu6NeD+YYhwNFgeN8HkcuchJk4oHT3PIpsJvRnSsI7BOHG4OYyKi0iBk+SpWuZOPhn0orRhzbWu6bINnznemUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750748601; c=relaxed/simple;
	bh=5yxFHUftbyV+RMCcFSunsXqR9/ZdNxpPFMQ7e3zC6zc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=k1JoWR6hv5D5gRds6MtIuIZFUS47cUYNEvbhEUx6e9OrDpEKE/uuNvUZH8psCwcwevT607bYkBpXgY+R0DzDo0Bud95t9/o4eNEHHxFu4SEqtFOWjDXUwDx+4sxsihnm5NC76GdryKjHF4YXfgb2TdUJfa500pKaRd43W3ZqahI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com; spf=pass smtp.mailfrom=awinic.com; arc=none smtp.client-ip=115.124.28.125
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=awinic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=awinic.com
Received: from ubuntu-VirtualBox..(mailfrom:wangweidong.a@awinic.com fp:SMTPD_---.dVKPy6z_1750748268 cluster:ay29)
          by smtp.aliyun-inc.com;
          Tue, 24 Jun 2025 14:57:50 +0800
From: wangweidong.a@awinic.com
To: broonie@kernel.org
Cc: colin.i.king@gmail.com,
	lgirdwood@gmail.com,
	linux-kernel@vger.kernel.org,
	linux-sound@vger.kernel.org,
	perex@perex.cz,
	thorsten.blum@linux.dev,
	tiwai@suse.com,
	u.kleine-koenig@baylibre.com,
	wangweidong.a@awinic.com,
	yijiangtao@awinic.com,
	zhujun2@cmss.chinamobile.com
Subject: Re: [PATCH V2] ASoC: codecs: Add calibration function to aw88399 chip
Date: Tue, 24 Jun 2025 14:57:48 +0800
Message-ID: <20250624065748.60509-1-wangweidong.a@awinic.com>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <aFVgVTIe5oT0MkZy@finisterre.sirena.org.uk>
References: <aFVgVTIe5oT0MkZy@finisterre.sirena.org.uk>
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Thank you very much for your review=0D
=0D
On Fri, Jun 20, 2025 at 14:21:25PM +0100, broonie@kernel.org wrote:=0D
> On Fri, Jun 20, 2025 at 07:08:44PM +0800, wangweidong.a@awinic.com wrote:=
=0D
=0D
>> +static int aw_cali_svc_dev_cali_re(struct aw88399 *aw88399)=0D
>> +{=0D
>> +	struct aw_device *aw_dev =3D aw88399->aw_pa;=0D
>> +	int ret;=0D
>> +=0D
>> +	mutex_lock(&aw88399->lock);=0D
>> +	aw_cali_svc_run_mute(aw_dev, CALI_RESULT_NORMAL);=0D
>> +=0D
>> +	ret =3D aw_cali_svc_cali_re_mode_enable(aw_dev, true);=0D
>> +	if (ret) {=0D
>> +		dev_err(aw_dev->dev, "start cali re failed\n");=0D
>> +		goto re_mode_err;=0D
>> +	}=0D
>> +=0D
>> +	msleep(3000);=0D
=0D
> Callibration takes 3s which is a fairly long time.=0D
=0D
This time is because the chip needs to wait for =0D
the data to stabilise during calibration =0D
in order to ensure more accurate calibration values.=0D
I will reduce this time to 1s.=0D
=0D
>> @@ -1588,6 +1968,13 @@ static int aw88399_re_get(struct snd_kcontrol *kc=
ontrol,=0D
>>  	struct snd_soc_component *codec =3D snd_soc_kcontrol_component(kcontro=
l);=0D
>>  	struct aw88399 *aw88399 =3D snd_soc_component_get_drvdata(codec);=0D
>>  	struct aw_device *aw_dev =3D aw88399->aw_pa;=0D
>> +	int ret;=0D
>> +=0D
>> +	if (aw_dev->status) {=0D
>> +		ret =3D aw_cali_svc_dev_cali_re(aw88399);=0D
>> +		if (ret)=0D
>> +			return -EPERM;=0D
>> +	}=0D
=0D
> AFAICT it's triggered if the device is powered on and userspace reads=0D
> the control that reports the callibration value.  That seems like it's a=
=0D
> bit too easy to trigger - something like running amixer would read the=0D
> control and lock the CODEC up for 3s, and I'm guessing that if the CODEC=
=0D
> is powered due to audio playing that'd result in disruption to users=0D
> listening to that audio.  I think it'd be better to have another write=0D
> only control (or volatile one which reads 0 always) that triggers the=0D
> calibration when userspace writes to it ("Calibrate Now Switch" or=0D
> something).  Since the calibration is also directly writable from=0D
> userspace we can't just use a write to this control.  In general it=0D
> should always be possible to read controls without disrupting anything=0D
> else that's going on.=0D
=0D
> BTW since the calibration is dynamically done the control should be=0D
> flagged as volatile.=0D
I will make the following two changes:=0D
1.Add an additional "Calib Switch" Kcontrol to =0D
  indicate whether calibration operations can be performed.=0D
2.Add "Trigger Calib" to Kcontrol. =0D
  This Kcontrol is write-only. When calibration is allowed,=0D
  perform the calibration operation.=0D
=0D
Thank you again.=0D
=0D
Best regards,=0D
Weidong Wang=0D
