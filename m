Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A895D1E4AB;
	Fri,  6 Jun 2025 12:50:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749214233; cv=none; b=Ll2Bi3vMTUsTDpy/xmha1qP8wGNXXr8pJtCaqZLCTHC5UCWhhrUxZDvGZKiVGIgiH44z1TJZXtnOOzCOsK4LPhmdBbJ2ZqPHhC8BXg5GriT32SOm1KkZz0b0KPXYBrLp4ArP+UaM63/7Ej69ZM2dFZ2Q73lJbh6TWkefnDslKEA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749214233; c=relaxed/simple;
	bh=W+LlfNk2HsbBqdZ79RTapibL/KsF2dILx+zv70pwrYI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R/FvPRYWLJ2YZE833dbZJZ6L7TIACoIBVlALzWyA76QsDW/WbmiO3EelxQbmZzdacu+l0Be/NVHAcJHMAgEnSKnjkdrbr/gSWNpmy5R6xOyTQqwrYXfWRdIaDHZVXagRTtuKbcUSwFOuKOQMKiUL9Ao9Z1QjSrl0rVUHz2de6QU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ix5pt9hO; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ix5pt9hO"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-235a6b89dfaso3281905ad.3;
        Fri, 06 Jun 2025 05:50:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749214231; x=1749819031; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0J3vuS2o0FutGzGx+1kPPU7uFTM+MDxsKMVlIteTB4Q=;
        b=Ix5pt9hOwGA+OYCfEhci34fbRDASA9xb7JYJy0ewotj0CcCYNKaBdD60cZwPgf26ek
         AZU907C1ujZmPFeNvdNl1WQs3VTjqrpV/xN4XaMvi2q9dFFTPjbMNeZ43Rv8oSPCl4UR
         486VLSs6iVNI+MQ8MxGgnUX+XT7U42eZz8OSOkz9jwGKoMubIADDzBtRkSFH9fE3vqWL
         8nTfT40KDtwDpqZyhByFwjxCTcqOSHmPJx+WkHcs0j7U60ISzUfpN3O+95pXBnfnBjqm
         Hj7UQvkzfX+ze0uDuPgdzx2FjsN7zr2YYSas1f3VSVdWc/92HjIrWnqiILylgEovn519
         RYXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749214231; x=1749819031;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0J3vuS2o0FutGzGx+1kPPU7uFTM+MDxsKMVlIteTB4Q=;
        b=KTa2OczGEE5nJuVGNet+abeZRET9akrXrHbbu+bRXVb4vXQe+8U+HpLvcWv3GCN2L4
         sfI3xudGE7C7E4yQTqBvtf04muWU75n3gBFLrJRhWKGdpyO1FH6qIcuuj7ZVsrEXK0JA
         taLPlUNb7PvTx2ReebzAbSpZCEznosmDgfWIby7Uzv7dTxj4zj6/5ysJvcHx1fFnTC3H
         P2b7l/lXQvMhy/XxUERRAVpJwRQWUqr8AiCut0bihcre17JU/rRmFeDmdp+M72W/aSOF
         yjdfSA00PW5Pra0Q35dQGb4X3VjaJdgEp09VKpg2EVQLBz4EMjy9PYn7w4szfdN5nUz1
         lHFQ==
X-Forwarded-Encrypted: i=1; AJvYcCUjyb/h631Q9Inl6Ux1HXPyo2+tCNcfBcM1tSI4mxq1NrxYlW+0kc+3EAWKk45zTK1VSIEAMPBADQK4NkU=@vger.kernel.org, AJvYcCVzznssAneEzPFuEPyofOzbrsoslUA0exMB+7Z/ewwl0noG/9O2N+U6MmTivxFo8HAKn7vABWax9UGs@vger.kernel.org
X-Gm-Message-State: AOJu0YyYcpdBeV7BYPXJa1yQdOfjxR3GdnRk17WWjWyHTbI+XqqvkLNe
	NDjTw0vk9ueKDn/9wBPCzxJPP4yNVC7Zn62ZuPtsfU/yH0U77lToWHs=
X-Gm-Gg: ASbGnctQW+en5blSkafQh4BCYYL9byruFWqguDD9OOH2oCIx6sCa6In0RZChL5P2TC0
	/FSEGyH653kxPmwE9BJ2aT1BViqvjo5uczh+jA3AmQHIT37b1KSBVsHjFu332nLZHp1kHNbjXsZ
	1lbWuTzXGxlMUhjS2+4J77/70w0vFCSVT8Zrepedo4c/XzQy7B5uy7btKACl+C3Zc4g7PmBkGo3
	+oA3D1PQFtAHVQ+Cj5XxP0IkV9VXmxr4wan1nNN3rTFgf4iTslqb63BHCfUeeqYGjSw28HvFs3R
	bH5c6DWxYKfDueFFcbuflE8aPCw4ErTI+RLC/swq1kasPtW7ZNzUvhollCv5mi5eiLPvQTv3GWt
	p08AITMiCPP6HaCp3v/ASNxpaxq0=
X-Google-Smtp-Source: AGHT+IHx0FKv5yZh74fOjj8IoRFYxtYWCQ/LS+Nkl4PMdKvrGGqAR3s4MnLBPejuysbls23PDTgzig==
X-Received: by 2002:a17:902:f54d:b0:235:caf9:8b1d with SMTP id d9443c01a7336-236040902d7mr13142645ad.12.1749214230898;
        Fri, 06 Jun 2025 05:50:30 -0700 (PDT)
Received: from ?IPV6:2406:7400:56:b5f1:3fae:6c04:a3e1:b0f3? ([2406:7400:56:b5f1:3fae:6c04:a3e1:b0f3])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23603092f50sm11705095ad.71.2025.06.06.05.50.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Jun 2025 05:50:30 -0700 (PDT)
Message-ID: <6f02afbe-cc55-4fe2-8615-1547f1d43efa@gmail.com>
Date: Fri, 6 Jun 2025 18:20:27 +0530
Precedence: bulk
X-Mailing-List: linux-kernel@vger.kernel.org
List-Id: <linux-kernel.vger.kernel.org>
List-Subscribe: <mailto:linux-kernel+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kernel+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [BUG] usb-serial-simple: device conflict with Owon VDS1022I
To: Greg KH <gregkh@linuxfoundation.org>
Cc: johan@kernel.org, linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org
References: <6430992c-d50b-4cfd-bcb9-d7d376c53444@gmail.com>
 <2025060620-twister-starved-3fb8@gregkh>
Content-Language: en-US
From: Amit <lestoppe@gmail.com>
In-Reply-To: <2025060620-twister-starved-3fb8@gregkh>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Greg,

     You've made valid points on both. Let me check with the authors of 
the software, there is an ongoing discussion on this.

regards,

Amit

On 06/06/25 17:47, Greg KH wrote:
> On Fri, Jun 06, 2025 at 05:00:29PM +0530, Amit wrote:
>> Hi,
>>
>>      PATCH 6.1 082/167 adds serial support for OWON HDS200 through the simple
>> usb serial driver (). This causes issues with Owon VDS1022. The VID and PID
>> is the same for both devices so the the Linux kernel loads the serial
>> driver, preventing the associated software from working.
> As vendors are not supposed to use the same device id for different
> devices, that's against the USB.org rules, so that's on them, not us :)
>
>>      My current work around for this is to blacklist usb_serial_simple. Given
>> that this driver change was recent and still under testing, could we find a
>> solution for this that doesn't involve such hacks at my end.
>>
>>      I  was able to root cause this issue only because the USB device and
>> software was working correctly before. A new user would just assume that the
>> device is not Linux compatible.
>>
>>      I've filed a bugzilla report here :
>> https://bugzilla.kernel.org/show_bug.cgi?id=220193
>>
>>      This is the software : https://github.com/florentbr/OWON-VDS1022
> As that's just using libusb, it can disconnect the device from the
> usb-serial driver if it needs to from the program itself.  Why not
> suggest this change to the authors of the software, OR just change it to
> use the serial connection that the kernel now presents instead of
> attempting to talk to it directly from userspace?
>
> thanks,
>
> greg k-h
