Received: from trinity3.trinnet.net (trinity.trinnet.net [96.78.144.185])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 94E5C148857;
	Mon,  9 Jun 2025 23:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=96.78.144.185
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749511881; cv=none; b=jKusLQomTLgEdxuzda+furkBgbX1sQsGUSvDtGPeeDSzSVqGaC2wi+jExms7bPZSwzAs2+tpFan0JJjpatPK8ZjfV97+WWP/KEoe8qZ+mVAeaOm7d8SXiAMTPEYmBS5jRDiE+EfghUMoCDJ4WVtY9sFfh6K6BCLtrOrwwJSZXac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749511881; c=relaxed/simple;
	bh=e4cngVeTJ3eRhYpYUjJHLm0cfk8IWeU6ftfJPlRuRXA=;
	h=Subject:To:References:Cc:From:Message-ID:Date:MIME-Version:
	 In-Reply-To:Content-Type; b=BL5BeXG5ZkvlR1RVfs6Ty5fs0ypcykbssGMAtzjQumvLoKqoHgxdglc6GY6CWMEw14nxBjL1en0XgoiIu3QfQNwSmgL820bpFqH1zS81mQRvxfh55On6VKzbGzKlFaTszcHS9cLd2RKsCa5NvHmjHHltvhXdUUt1WkjaQoZjDPA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net; spf=pass smtp.mailfrom=trinnet.net; arc=none smtp.client-ip=96.78.144.185
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=trinnet.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=trinnet.net
Received: from trinity4.trinnet.net (trinity4.trinnet.net [192.168.0.11])
	by trinity3.trinnet.net (TrinityOS hardened/TrinityOS Hardened) with ESMTP id 559NUq2A013070;
	Mon, 9 Jun 2025 16:30:52 -0700
Subject: Re: [PATCH net] netrom: fix possible deadlock in nr_rt_device_down
To: Jakub Kicinski <kuba@kernel.org>
References: <20250605105449.12803-1-arefev@swemel.ru>
 <20250609155729.7922836d@kernel.org>
 <5f821879-6774-3dc2-e97d-e33b76513088@trinnet.net>
 <20250609162642.7cb49915@kernel.org>
Cc: Denis Arefev <arefev@swemel.ru>, "David S. Miller" <davem@davemloft.net>,
        Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
        Simon Horman <horms@kernel.org>, Nikita Marushkin <hfggklm@gmail.com>,
        Ilya Shchipletsov <rabbelkin@mail.ru>,
        Hongbo Li <lihongbo22@huawei.com>, linux-hams@vger.kernel.org,
        netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
        lvc-project@linuxtesting.org, stable@vger.kernel.org,
        syzbot+ccdfb85a561b973219c7@syzkaller.appspotmail.com
From: David Ranch <linux-hams@trinnet.net>
Message-ID: <4cfc85af-c13a-aa9c-a57c-bf4b6e0f2186@trinnet.net>
Date: Mon, 9 Jun 2025 16:30:52 -0700
User-Agent: Mozilla/5.0 (X11; Linux i686; rv:45.0) Gecko/20100101
 Thunderbird/45.8.0
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20250609162642.7cb49915@kernel.org>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-3.0 (trinity3.trinnet.net [192.168.0.1]); Mon, 09 Jun 2025 16:30:52 -0700 (PDT)


That's unclear to me but maybe someone else knowing the code better than 
myself can chime in.  I have to assume having these locks present
are for a reason.

--David
KI6ZHD


On 06/09/2025 04:26 PM, Jakub Kicinski wrote:
> On Mon, 9 Jun 2025 16:16:32 -0700 David Ranch wrote:
>> I'm not sure what you mean by "the only user of this code".  There are
>> many people using the Linux AX.25 + NETROM stack but we unfortunately
>> don't have a active kernel maintainer for this code today.
>
> Alright, sorry. Either way - these locks are not performance critical
> for you, right?
>
