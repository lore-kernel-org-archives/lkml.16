Received: from mout.web.de (mout.web.de [217.72.192.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DA8226A0DF;
	Mon, 28 Apr 2025 13:10:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.72.192.78
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745845850; cv=none; b=VgxpMYf1dSooYY4ypIOTX2JBtzajGTnujzliqiMcEs+aKACp+gA7n6OlupSstW4/x3EJuDNgeEHUQYt+UkHeTHi5OsoBEHkMZgNNUQJguX+tcxwJUKo1wTXaq23vd2j3TUTEtKHQkZxqsByCKdLsRaebe1seJ+DB+5t/g2tulAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745845850; c=relaxed/simple;
	bh=At5UKB7oyVRcNvD9iUloYPOfxZ3cZq2rneQ6eqRpVPQ=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=L4fHGLnbIqvtRUoxc/PVS+EuTSIDlJw5pqRRnIFZAPJG7XPspePuyyPh8BqxWonz5NttO/xXCgx06LJi4SKhO0jOJjXgo/vJqttHH/e+NiMHmfU8z2W5Kciv6kcjDJcUHgJibHpYBZTmY/wWMGyU85wJNfbu3SfwNyw+97Ja4Tw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=T8QmOa8J; arc=none smtp.client-ip=217.72.192.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="T8QmOa8J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745845846; x=1746450646; i=markus.elfring@web.de;
	bh=At5UKB7oyVRcNvD9iUloYPOfxZ3cZq2rneQ6eqRpVPQ=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=T8QmOa8JdXJPG+mtey0Gt9AHrfFGS3/nZRENjeQzolsLocssCkneAOXfHkja4rqV
	 2J27E1xaJOAll3nRJ2cxuKvZDYbU810tTQevTeOc/PrpuTlcyGGH8aLjOig8zX7l7
	 2Om6d7e+UxQAbg8cFtZkqgaUH1g/Va1bb7VhOZf6/ajMCYdtZOLmlzp324uBLfnzf
	 Svs1SvmGldmjcuhwf4D7EuU7mtnrgzeD2F4cjR+NNO7QDjwn4avTIP4bMTPOYo0Qi
	 D3olXK3cLXvbVcuaoC3iq1N3Z96tT1JjN9moIIAdNzTCqgl9Y/DwwnGqrvPY5eCj+
	 9N9KbZUR7OxwvB5LZQ==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.68]) by smtp.web.de (mrweb105
 [213.165.67.124]) with ESMTPSA (Nemesis) id 1MBjIE-1uEqJW0uom-00EvpI; Mon, 28
 Apr 2025 15:10:46 +0200
Message-ID: <2583415c-6338-47ba-9688-eae9d5ae6736@web.de>
Date: Mon, 28 Apr 2025 15:10:43 +0200
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Julien Massot <julien.massot@collabora.com>, linux-sound@vger.kernel.org,
 sound-open-firmware@alsa-project.org
Cc: kernel@collabora.com, LKML <linux-kernel@vger.kernel.org>,
 Bard Liao <yung-chuan.liao@linux.intel.com>,
 Daniel Baluta <daniel.baluta@nxp.com>, Jaroslav Kysela <perex@perex.cz>,
 Kai Vehmanen <kai.vehmanen@linux.intel.com>,
 Liam Girdwood <liam.r.girdwood@intel.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 =?UTF-8?Q?P=C3=A9ter_Ujfalusi?= <peter.ujfalusi@linux.intel.com>,
 Pierre-Louis Bossart <pierre-louis.bossart@linux.dev>,
 Ranjani Sridharan <ranjani.sridharan@linux.intel.com>,
 Takashi Iwai <tiwai@suse.com>
References: <20250428-fixup-of-sof-topology-v1-1-dc14376da258@collabora.com>
Subject: Re: [PATCH] ASoC: SOF: topology: Fix null pointer derefence
Content-Language: en-GB, de-DE
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250428-fixup-of-sof-topology-v1-1-dc14376da258@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:kSjMG39RiIHQdnRGPvLSRI0NpeiiVYj2v+HdIFYVjJfS4XWlqYo
 yBmFHzMnwhK2Lu/vJoLM2JJniIES5QQPxm/KANsOpCvEl8V04ejXAArtIQvC0CUkVtc4uNW
 udzJdAbPMvEXdVdNvb9yhQ/6RCPvdQrUQ4tHCyGFutpHWerf148awF9NbP12OxSM0khJwEp
 8OzaubDD8Qc/wmZAe5xYA==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:p8cHZn6hnQE=;4SvAO5B+bsnKeGEdyjgVhhOaUYy
 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

=E2=80=A6
> check first for null machine.

Would a summary phrase like =E2=80=9CPrevent null pointer dereference in s=
nd_sof_load_topology()=E2=80=9D
a bit nicer?

Regards,
Markus
