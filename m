Received: from mail-qt1-f178.google.com (mail-qt1-f178.google.com [209.85.160.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1757D23909F
	for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 15:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749569841; cv=none; b=bWnuXG0aEI2R7CvmMooiqeGl7HP19QU9fCQ4XlNiOjeA8UkrrOoz5sI7pmyTedfgWj8Gzfl5M//08N1Gvxi9DonTMLdAD22fRpP4YnxYi++AtUWLmnYgWdCx/ybUsPwdPtGMxECl98mYWxXiq+Fxjf1/YcYAn1QqbmDaSoMviiU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749569841; c=relaxed/simple;
	bh=Ge1LFO3GJbt9hd5N8cGDfDJg7Ju9ZPGoCT0kFFxY694=;
	h=Content-Type:Message-ID:Date:MIME-Version:To:Cc:From:Subject; b=r7RRIpcjsjom7rSZx437tHbQTsD+CLtzv8qSUFmN56eUJb5gH3NPg9sO8lGgqZJzuSKFywRXpfPWLsw/RRgYSnRFW4GdU+Mo39IKuNHPu09R1APFbjAzADsmuPu5rLRzWo9YK0sIXnXzYL/gZa3iDzhd5Aw8hO6QAE3H6OVo/Qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ON2vEwHa; arc=none smtp.client-ip=209.85.160.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ON2vEwHa"
Received: by mail-qt1-f178.google.com with SMTP id d75a77b69052e-4a5ae2fdf4eso61854671cf.0
        for <linux-kernel@vger.kernel.org>; Tue, 10 Jun 2025 08:37:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google; t=1749569837; x=1750174637; darn=vger.kernel.org;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nh+mGpHpRQJpNMq16cUvVk7l1gQB7lXYTYB8ff8wx5k=;
        b=ON2vEwHa6wpDttnIQUUM1hkDGhGAF48c1oOwgFGzl9uxk8+GxucSGtA0nwumkRqmT3
         om+D5offFKK8MGcLDRm+uYK0jqBW0L3Z/ReRxZfP2TNVtSWDrMYU0vlf64Z9Te3LMdti
         dLiTCVwCofbWAVjI0tJDyNVKoo56oFktIhUFw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749569837; x=1750174637;
        h=subject:from:cc:to:content-language:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nh+mGpHpRQJpNMq16cUvVk7l1gQB7lXYTYB8ff8wx5k=;
        b=wA3dn3z2G+ZJskK4kKKw0N5WWnBGwMNMgxJdH1aR35vwDDVq0AwlNge1RL1N9N5KzC
         7ekBSYaQPiRwXyiyRgXcL2aLk1roLInwtYOjFaGgSnTfbmj9JAwLTW0kZINGQqn388Nt
         i3tH4PMgL7kP4tVQhMsYIl+JA/GFYqfWTntiMMCZc/bjfYg7kHR2VQHWmoxlYenBVJRB
         LEGd8Hrf4wQBM5QQSVo9EzoXE/V4orjrGpMJLP+rrCxA16Rxa6Byd09YJpbiij17f9le
         vNonxBssJJu6vopa4EExuoehr+C2iC52XfRc9fCDpHC7RQ8l5ZzVFMnT+vdlyXjQpn0g
         RxpQ==
X-Forwarded-Encrypted: i=1; AJvYcCW6Uf3YmLDfHEMZqrsL4juzDAEA0aKkKYThnQHmkmDH8TserrAySFudPe/fWE/QiEm6dwEP3ZYU7ibOp3A=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDR8dybq/KTvmVRcCVKPNpKL9qOzck+Ur23jGJXQ6l6JgONPtV
	7RECI97pd/ty2IWK8Oi665dpFQE5sAbtpYtM4Gr8OShQe/AmolSiiVGI5ZeXhBRnuCk=
X-Gm-Gg: ASbGncuMSlV4YEyYhljD1xI/5jlotPdouhJP+GIIduAKzLTJSreaMB8YVxRbS8YOvvY
	pzHYJCyEHazAv55gz+hbVpGnfxOvAfvUc62M7oTbi4x/u8eX6AheQA+JVrMEoGn1lrjCVpLAu69
	SrUrVv0pU1k2nC4tBkO/QdHom15qGAUTGOKOL9EjcAw0hoc8nXLk8yzmqh7snKKwWEZqMpm20gX
	6YU4sWmTG4ij9d3OIp6R79YUcKcki1j5pfCxj7U1IUxspWFMI/gafD3RDQC0zbwRFQxbmugxDFp
	OyDc2dJMEkPW92ygNKjOHhkrn0y6VtWaF0Jq9b0nCs6tBc/KMgnHlu/OWLaYDX0YD26MQPMx0mb
	+AcHliE3efBc=
X-Google-Smtp-Source: AGHT+IHZRFV8Mnfm66KxgqbQ+xn/V03aqh6SUiPn4eSw5iLcmKe2WvnZXGgaVLUZu9Zeyu5/wNzwfA==
X-Received: by 2002:a05:622a:5587:b0:49c:d64b:3d5f with SMTP id d75a77b69052e-4a708ce76e9mr56271861cf.9.1749569836627;
        Tue, 10 Jun 2025 08:37:16 -0700 (PDT)
Received: from [10.212.144.179] ([12.216.155.19])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4a6ef785c23sm57361681cf.35.2025.06.10.08.37.15
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Jun 2025 08:37:16 -0700 (PDT)
Content-Type: multipart/mixed; boundary="------------Zvf7rR069wIOZjcyzA1npCtG"
Message-ID: <ab7fe518-0177-4178-a40d-51e0a5fbe8aa@linuxfoundation.org>
Date: Tue, 10 Jun 2025 09:37:15 -0600
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: shuah <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
 "John B. Wyatt IV" <jwyatt@redhat.com>, John Kacur <jkacur@redhat.com>,
 Thomas Renninger <trenn@suse.com>, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Thorsten Leemhuis <linux@leemhuis.info>
From: Shuah Khan <skhan@linuxfoundation.org>
Subject: [GIT PULL] cpupower urgent fix for Linux 6.16-rc2

This is a multi-part message in MIME format.
--------------Zvf7rR069wIOZjcyzA1npCtG
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Rafael,

Please pull this cpupower urgent fix for Linux 6.16-rc2.

Add unitdir variable for specifying the location to install systemd
service units instead of installing under ${libdir}/systemd/system
which doesn't work on some distributions.

Note: I meant to send this during the merge window and ran into some
merge conflicts during the PR test. Decided to wait on it until rc1.

diff is attached.

thanks,
-- Shuah

----------------------------------------------------------------
The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

   Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

   git://git.kernel.org/pub/scm/linux/kernel/git/shuah/linux tags/linux-cpupower-6.16-rc2-fixes

for you to fetch changes up to e044b8a9545cd8265c7110c179aeec2624c16455:

   cpupower: split unitdir from libdir in Makefile (2025-06-09 10:17:46 -0600)

----------------------------------------------------------------
linux-cpupower-6.16-rc2-fixes

Add unitdir variable for specifying the location to install systemd
service units instead of installing under ${libdir}/systemd/system
which doesn't work on some distributions.

----------------------------------------------------------------
Francesco Poli (wintermute) (1):
       cpupower: split unitdir from libdir in Makefile

  tools/power/cpupower/Makefile | 9 +++++----
  1 file changed, 5 insertions(+), 4 deletions(-)

----------------------------------------------------------------
--------------Zvf7rR069wIOZjcyzA1npCtG
Content-Type: text/x-patch; charset=UTF-8;
 name="linux-cpupower-6.16-rc2-fixes.diff"
Content-Disposition: attachment; filename="linux-cpupower-6.16-rc2-fixes.diff"
Content-Transfer-Encoding: base64

ZGlmZiAtLWdpdCBhL3Rvb2xzL3Bvd2VyL2NwdXBvd2VyL01ha2VmaWxlIGIvdG9vbHMvcG93
ZXIvY3B1cG93ZXIvTWFrZWZpbGUKaW5kZXggYmU4ZGZhYzE0MDc2Li5jNDNkYjFjNDEyMDUg
MTAwNjQ0Ci0tLSBhL3Rvb2xzL3Bvd2VyL2NwdXBvd2VyL01ha2VmaWxlCisrKyBiL3Rvb2xz
L3Bvd2VyL2NwdXBvd2VyL01ha2VmaWxlCkBAIC03Myw2ICs3Myw3IEBAIHNiaW5kaXIgPz0J
L3Vzci9zYmluCiBtYW5kaXIgPz0JL3Vzci9tYW4KIGxpYmRpciA/PQkvdXNyL2xpYgogbGli
ZXhlY2RpciA/PQkvdXNyL2xpYmV4ZWMKK3VuaXRkaXIgPz0JL3Vzci9saWIvc3lzdGVtZC9z
eXN0ZW0KIGluY2x1ZGVkaXIgPz0JL3Vzci9pbmNsdWRlCiBsb2NhbGVkaXIgPz0JL3Vzci9z
aGFyZS9sb2NhbGUKIGRvY2RpciA/PSAgICAgICAvdXNyL3NoYXJlL2RvYy9wYWNrYWdlcy9j
cHVwb3dlcgpAQCAtMzA5LDkgKzMxMCw5IEBAIGluc3RhbGwtdG9vbHM6ICQoT1VUUFVUKWNw
dXBvd2VyCiAJJChJTlNUQUxMX0RBVEEpIGNwdXBvd2VyLXNlcnZpY2UuY29uZiAnJChERVNU
RElSKSR7Y29uZmRpcn0nCiAJJChJTlNUQUxMKSAtZCAkKERFU1RESVIpJHtsaWJleGVjZGly
fQogCSQoSU5TVEFMTF9QUk9HUkFNKSBjcHVwb3dlci5zaCAnJChERVNURElSKSR7bGliZXhl
Y2Rpcn0vY3B1cG93ZXInCi0JJChJTlNUQUxMKSAtZCAkKERFU1RESVIpJHtsaWJkaXJ9L3N5
c3RlbWQvc3lzdGVtCi0Jc2VkICdzfF9fX0NESVJfX198JHtjb25mZGlyfXw7IHN8X19fTERJ
Ul9fX3wke2xpYmV4ZWNkaXJ9fCcgY3B1cG93ZXIuc2VydmljZS5pbiA+ICckKERFU1RESVIp
JHtsaWJkaXJ9L3N5c3RlbWQvc3lzdGVtL2NwdXBvd2VyLnNlcnZpY2UnCi0JJChTRVRQRVJN
X0RBVEEpICckKERFU1RESVIpJHtsaWJkaXJ9L3N5c3RlbWQvc3lzdGVtL2NwdXBvd2VyLnNl
cnZpY2UnCisJJChJTlNUQUxMKSAtZCAkKERFU1RESVIpJHt1bml0ZGlyfQorCXNlZCAnc3xf
X19DRElSX19ffCR7Y29uZmRpcn18OyBzfF9fX0xESVJfX198JHtsaWJleGVjZGlyfXwnIGNw
dXBvd2VyLnNlcnZpY2UuaW4gPiAnJChERVNURElSKSR7dW5pdGRpcn0vY3B1cG93ZXIuc2Vy
dmljZScKKwkkKFNFVFBFUk1fREFUQSkgJyQoREVTVERJUikke3VuaXRkaXJ9L2NwdXBvd2Vy
LnNlcnZpY2UnCiAKIGluc3RhbGwtbWFuOgogCSQoSU5TVEFMTF9EQVRBKSAtRCBtYW4vY3B1
cG93ZXIuMSAkKERFU1RESVIpJHttYW5kaXJ9L21hbjEvY3B1cG93ZXIuMQpAQCAtMzQ4LDcg
KzM0OSw3IEBAIHVuaW5zdGFsbDoKIAktIHJtIC1mICQoREVTVERJUikke2JpbmRpcn0vdXRp
bHMvY3B1cG93ZXIKIAktIHJtIC1mICQoREVTVERJUikke2NvbmZkaXJ9Y3B1cG93ZXItc2Vy
dmljZS5jb25mCiAJLSBybSAtZiAkKERFU1RESVIpJHtsaWJleGVjZGlyfS9jcHVwb3dlcgot
CS0gcm0gLWYgJChERVNURElSKSR7bGliZGlyfS9zeXN0ZW1kL3N5c3RlbS9jcHVwb3dlci5z
ZXJ2aWNlCisJLSBybSAtZiAkKERFU1RESVIpJHt1bml0ZGlyfS9jcHVwb3dlci5zZXJ2aWNl
CiAJLSBybSAtZiAkKERFU1RESVIpJHttYW5kaXJ9L21hbjEvY3B1cG93ZXIuMQogCS0gcm0g
LWYgJChERVNURElSKSR7bWFuZGlyfS9tYW4xL2NwdXBvd2VyLWZyZXF1ZW5jeS1zZXQuMQog
CS0gcm0gLWYgJChERVNURElSKSR7bWFuZGlyfS9tYW4xL2NwdXBvd2VyLWZyZXF1ZW5jeS1p
bmZvLjEK

--------------Zvf7rR069wIOZjcyzA1npCtG--
